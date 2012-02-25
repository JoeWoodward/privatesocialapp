class OffersController < ApplicationController
  layout 'offers'

  def index
    @offers = Offer.where(:active => true)
    @orientation = 'horizontal'
  end

  def images
    @offers = Offer.where(:active => true)
    render layout: false
  end

  def partners
    @partners = Partners.all
  end
end
