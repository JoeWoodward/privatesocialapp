class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(params[:user][:email], params[:user][:password])
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit

  end

  def update
  end

  def show
    @user = User.find(params[:id])
  end
end
