class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to account_details_path
    else
      redirect_to sign_up_path
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
