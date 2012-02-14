class OffersController < ApplicationController
  before_filter :orientation

  def index
    @offers = Offer.where(:active => true)
  end
end
