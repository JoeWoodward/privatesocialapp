class Admin::AdminsController < Admin::ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:user])
    # this is so that friendly id picks up the slug
    if @admin.save
      # when the payment system is added this method will need to be changed
      # to redirect to the hosted page.
      login(params[:admin][:email], params[:user][:password])
      redirect_to admin_account_path(@admin)
    else
      render :new
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:user])
      redirect_to admin_account_path(@admin), :notice => "You have successfully updated your personal details"
    else
      render :edit
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end
end
