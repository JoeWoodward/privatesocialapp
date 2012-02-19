class OffersController < ApplicationController
  before_filter :require_login
  before_filter :orientation

  def index
    @offers = Offer.where(:active => true)
    @orientation = 'horizontal'
  end

  def images
    @offers = Offer.where(:active => true)
    render layout: false
  end
end
