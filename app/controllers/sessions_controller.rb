class SessionsController < ApplicationController
  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_to account_path(user), :notice => "Logged in as #{ current_user.email }"
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
