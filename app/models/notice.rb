class Notice < ActiveRecord::Base
  # image uploader for carrierwave
  mount_uploader :image, NoticeImageUploader

  # use the title for the id
  extend FriendlyId
  friendly_id :title, use: :slugged

  # format the attributes before saving them
  before_save :format_notice

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :image

  validates_uniqueness_of :description

  validates_format_of :contact_phone, :with => /[[\s]-[\d]]/x, :allow_blank => true

  def format_notice
    self.title = self.title.titleize
    if self.contact_email
      self.contact_email = self.contact_email.downcase
    end
  end
end
