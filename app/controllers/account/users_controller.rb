class Account::UsersController < Account::AccountController
  before_filter :require_login, :except => [:new, :create]
  before_filter :orientation

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    # this is so that friendly id picks up the slug
    if @user.save

      # when the payment system is added this method will need to be changed
      # to redirect to the hosted page.
      login(params[:user][:email], params[:user][:password])
      redirect_to account_path
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes(params[:user])
      redirect_to account_path, :notice => "You have successfully updated your personal details"
    else
      render :edit
    end
  end

  def show
    @user = current_user
  end
end
