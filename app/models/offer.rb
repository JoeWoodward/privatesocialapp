class Offer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :image, OfferImageUploader

  validates_presence_of :name
  validates_presence_of :image

  validates_uniqueness_of :name
end
