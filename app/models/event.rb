class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :image, EventImageUploader

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :date
  validates_presence_of :image

  validates_uniqueness_of :description

  validate :date_is_in_the_future
  before_save :titleize

  def date_is_in_the_future
    # add an error if the date isn't in the future
    if self.date.present?
      unless self.date > Date.today
        errors.add(:date, "The event must be in the future")
      end
    end
  end

  def titleize
    self.title = self.title.titleize
  end
end
