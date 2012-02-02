class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    # this is so that friendly id picks up the slug
    @user.full_name = "#{@user.first_name} #{@user.last_name}"
    if @user.save
      # when the payment system is added this method will need to be changed
      # to redirect to the hosted page.
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
