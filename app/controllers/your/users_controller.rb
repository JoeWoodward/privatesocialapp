class Your::UsersController < ApplicationController
  before_filter :require_login, :except => [:new, :create]
  before_filter :orientation

  def new
    @user = User.new
    logout
  end

  def create
    @user = User.new(params[:user])

    # this is so that friendly id picks up the slug
    if @user.save

      # when the payment system is added this method will need to be changed
      # to redirect to the hosted page.
      login(params[:user][:email], params[:user][:password])
      redirect_to your_details_path
    else
      render :new
    end
  end

  def edit
    @user = current_user
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
end