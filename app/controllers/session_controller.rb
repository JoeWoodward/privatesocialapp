class SessionController < ApplicationController
  def create
    user = login(params[:email].downcase, params[:password], params[:remember_me])
    if user
      redirect_to user_path(user), :notice => "Logged in as #{ current_user.email }"
    else
      flash.now.alert = 'Email or Password was invalid'
      render :new
    end
  end

  def destroy
    logout
    if !@user
      redirect_to root_path, :notice => 'Logged out!'
    end
  end
end
