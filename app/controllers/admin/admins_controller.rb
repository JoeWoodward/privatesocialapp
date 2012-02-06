class Admin::AdminsController < Admin::ApplicationController
  before_filter :require_login
  before_filter :is_admin

  def index
    @admins = User.where(:is_admin => true).page(params[:page]).per(15)
  end

  def new
    @admin = User.new
  end

  def create
    @admin = User.new(params[:user])
    # this is so that friendly id picks up the slug
    if @admin.save
      # when the payment system is added this method will need to be changed
      # to redirect to the hosted page.
      login(params[:user][:email], params[:user][:password])
      redirect_to admin_account_path(@admin)
    else
      render :new
    end
  end

  def edit
    @admin = User.find(params[:id])
  end

  def update
    @admin = User.find(params[:id])
    if @admin.update_attributes(params[:user])
      redirect_to admin_account_path(@admin), :notice => "You have successfully updated your personal details"
    else
      render :edit
    end
  end

  def show
    @admin = User.find(params[:id])
  end

  def destroy
    @admin = User.find(params[:id])
    if @admin.destroy
      redirect_to admin_accounts_path
    end
  end
end
