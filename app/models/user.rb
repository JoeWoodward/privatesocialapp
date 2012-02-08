class User < ActiveRecord::Base
  has_many :notices

  # use sorcery for authentication
  authenticates_with_sorcery!

  # use friendly ids for users
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  # used to format the attributes of users so any format errors are corrected
  before_save :format_attributes

  attr_accessible :first_name, :last_name, :email, :password_confirmation, :password, :full_name, :is_admin

  # validations for user attributes
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :password, :on => :create
  validates_presence_of :password_confirmation, :on => :create

  validates_confirmation_of :password

  validates_uniqueness_of :email

  validates_length_of :password, :minimum => 5

  # before filter calls this method before save to check there are no errors in formatting
  def format_attributes
    self.email = self.email.downcase
    self.first_name = self.first_name.titleize
    self.last_name = self.last_name.titleize
    self.full_name = "#{self.first_name} #{self.last_name}"
  end

  def full_name
    [first_name, last_name].join(' ')
  end
end
