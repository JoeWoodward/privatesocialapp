class Your::UsersController < Your::YourController
  skip_before_filter :require_login
  before_filter :require_login, :except => [:new, :create]
  before_filter :orientation
  skip_before_filter :is_user_authorised

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.token = Digest::SHA1.hexdigest([Time.now, params[:user][:email]].join)
    if @user.save!
      login(@user.email, params[:user][:password])
      payment_page = PaymentProcessor.hosted_signup_page_for(@user)
      UserMailer.successful_registration(@user, payment_page).deliver
      # redirect to chargify
      redirect_to payment_page
    end

  rescue ActiveRecord::RecordInvalid
    render :new
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
    subscription = Chargify::Subscription.find(params[:subscription_id].to_i) rescue nil
    if subscription.customer.reference == params[:customer_reference]
      user = User.init!(params[:customer_reference], params[:subscription_id])
      user.save
      @user = User.find_by_token(params[:customer_reference])
      if user
        redirect_to your_details_path
      end
    end
  end

  def register_now
    redirect_to PaymentProcessor.hosted_signup_page_for(current_user)
  end

  def updated_billing_info
    redirect_to your_details_path, :notice => 'You have successfully updated your billing information'
  end
end
