class Admin::SessionsController < Admin::ApplicationController
  def new
    logout
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_to admin_accounts, :notice => "Logged in as #{ current_user.email }"
    else
      redirect_to admin_login_path, :notice => 'Email or password was invalid'
    end
  end

  def destroy
    logout
    if !current_user
      redirect_to admin_login_path, :notice => 'Logged out!'
    end
  end
end
