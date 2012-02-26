class SessionsController < ApplicationController
  skip_before_filter :require_login
  skip_before_filter :is_user_authorised

  def create
    @user = login(params[:user][:email], params[:user][:password], params[:remember])
    if @user
      redirect_to your_details_path, :notice => "Logged in as #{ current_user.email }"
    else
      redirect_to root_path, :notice => 'Email or password was invalid'
    end
  end

  def destroy
    logout
    if !@user
      redirect_to root_path, :notice => 'Logged out!'
    end
  end
end
