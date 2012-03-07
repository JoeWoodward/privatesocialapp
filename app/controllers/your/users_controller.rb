class Your::UsersController < Your::YourController
  skip_before_filter :require_login
  before_filter :require_login, :except => [:new, :create, :complete_registration]
  skip_before_filter :is_user_authorised

  def new
    @user = User.new
    @section_style = "half-width-translucent"
    @content_holder = "sign-up-content sign-up"
    render :layout => 'signup'
  end

  def create
    @user = User.new(params[:user])
    @user.token = Digest::SHA1.hexdigest([Time.now, params[:user][:email]].join)
    if @user.save!
      login(@user.email, params[:user][:password])
      payment_page = PaymentProcessor.hosted_signup_page_for(@user)
      UserMailer.successful_registration(@user).deliver
      # redirect to chargify
      redirect_to payment_page
    end

  rescue ActiveRecord::RecordInvalid
    @section_style = "half-width-translucent"
    @content_holder = "sign-up-content sign-up"
    render :new, :layout => 'signup'
  end

  def edit
  end

  def update
    if current_user.update_attributes(params[:user])
      redirect_to your_details_path, :notice => "You have successfully updated your personal details"
    else
      render :edit
    end
  end

  def show
    @user = current_user
  end

  def update_billing_detail
    @user = current_user
    redirect_to PaymentProcessor.update_payment_url_for(@user)
  end

  def complete_registration
    if User.find_by_token(params[:customer_reference])
      initialised_user = User.init!(params[:customer_reference], params[:subscription_id])
      initialised_user.save
      @user = User.find_by_token(params[:customer_reference])
      redirect_to your_details_path, notice: 'Congratulations,
      you have successfully joined the 48 Harley Street VIP Members Club'
    else
      redirect_to your_details_path, :notice => 'Sorry but something went wrong, please contact 48 Harley Street to fix the problem'
    end
  end

  def register_now
    redirect_to PaymentProcessor.hosted_signup_page_for(current_user)
  end

  def updated_billing_info
    redirect_to your_details_path, :notice => 'You have successfully updated your billing information'
  end

  def cancel_subscription
    if subscription = Chargify::Subscription.find(current_user.chargify_subscription_id.to_i)
      subscription.cancel_at_end_of_period = true
      subscription.save
      current_user.is_cancelling = true
      current_user.save
      redirect_to billing_info_path, :notice => "Your subscription will expire
      on #{subscription.current_period_ends_at.strftime("%A
      #{subscription.current_period_ends_at.day.ordinalize} of %B, %Y")}"
    else
      redirect_to billing_info_path, :notice => 'Sorry but something went
      wrong, please contact 48 Harley Street to resolve the issue'
    end
  end

  def revoke_subscription_cancellation
    if subscription = Chargify::Subscription.find(current_user.chargify_subscription_id.to_i)
      subscription.cancel_at_end_of_period = false
      subscription.save
      current_user.is_cancelling = false
      current_user.save
      redirect_to billing_info_path, :notice => "You have successfully revoked
      your cancellation"
    else
      redirect_to billing_info_path, :notice => 'Sorry but something went
      wrong, please contact 48 Harley Street to resolve the issue'
    end
  end

  def resubscribe
    if subscription = Chargify::Subscription.find(current_user.chargify_subscription_id.to_i)
      subscription.reactivate
      subscription.reload
      current_user.is_cancelling = false
      current_user.state = "pending"
      current_user.save
      redirect_to billing_info_path, :notice => "Congratulations, you have succesfully re-subscribed."
    else
      redirect_to billing_info_path, :notice => 'Sorry but something went
      wrong, please contact 48 Harley Street to resolve the issue'
    end
  end

  def billing_info
    subscription = Chargify::Subscription.find(current_user.chargify_subscription_id.to_i)
    @statements = subscription.statements
    @current_period_ends_at = subscription.current_period_ends_at
  end
end
