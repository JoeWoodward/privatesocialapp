class Admin::PartnersController < Admin::ApplicationController
  before_filter :require_login
  before_filter :is_admin

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(params[:partner])
    if @partner.save
      redirect_to admin_partner_path(@partner), :notice => "Successfully added #{@partner.name} to the list of partners"
    else
      render :new
    end
  end

  def index
    @partners = Partner.page(params[:page]).per(15)
  end

  def show
    @partner = Partner.find(params[:id])
  end

  def edit
    @partner = Partner.find(params[:id])
  end

  def update
    @partner = Partner.find(params[:id])
    if @partner.update_attributes(params[:partner])
      redirect_to admin_partner_path(@partner), :notice => "Successfully updated the details for #{@partner.name}"
    else
      render :edit
    end
  end

  def destroy
    @partner = Partner.find(params[:id])
    if @partner.destroy
      redirect_to admin_partners_path, :notice => "Successfully deleted #{@partner.name} from the list of partners"
    end
  end
end
