class Partner < ActiveRecord::Base
  # use friendly ids for users
  extend FriendlyId
  friendly_id :name, use: :slugged

  # image uploader for carrierwave
  mount_uploader :logo, PartnerLogoUploader

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :logo
end
