class Admin::OffersController < Admin::ApplicationController
  before_filter :require_login
  before_filter :is_admin

  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
    @offer = Offer.find(params[:id])
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(params[:offer])
    if @offer.save
      redirect_to admin_offer_path(@offer), notice: 'Offer was successfully created.'
    else
      render :new
    end
  end

  def update
    @offer = Offer.find(params[:id])

    if @offer.update_attributes(params[:offer])
      redirect_to admin_offer_path(@offer), notice: 'Offer was successfully updated.'
    else
      render :edit
    end
  end
end
