class User < ActiveRecord::Base
  has_many :bookmarks
  has_many :events, :through => :bookmarks

  has_many :notices

  # use sorcery for authentication
  authenticates_with_sorcery!

  # use friendly ids for users
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  # used to format the attributes of users so any format errors are corrected
  before_save :format_attributes
  before_save :format_vip_attributes, :if => :vip_member

  attr_accessible :first_name, :last_name, :email, :password_confirmation,
    :password, :full_name, :is_admin, :subscription_billing_date, :title,
    :date_of_birth, :house, :town, :post_code, :telephone, :mobile, :remember_me_token,
    :remember_me_expires_at, :remember_me

  # validations for user attributes
  validates_presence_of :first_name
  validates_presence_of :title, :if => :vip_member
  validates_presence_of :date_of_birth, :if => :vip_member
  validates_presence_of :house, :if => :vip_member
  validates_presence_of :telephone, :if => :vip_member
  validates_presence_of :mobile, :if => :vip_member
  validates_presence_of :town, :if => :vip_member
  validates_presence_of :post_code, :if => :vip_member
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :password, :on => :create

  validates_confirmation_of :password

  validates_uniqueness_of :email, message: 'email already in use'

  validates_length_of :password, :minimum => 5, :allow_blank => true

  validates_format_of :telephone, :with => /[[\s]-[\d]]/x, :allow_blank => true
  validates_format_of :mobile, :with => /[[\s]-[\d]]/x, :allow_blank => true

  # before filter calls this method before save to check there are no errors in formatting
  def format_attributes
    self.email = self.email.downcase
    self.first_name = self.first_name.titleize
    self.last_name = self.last_name.titleize
    self.full_name = "#{self.first_name} #{self.last_name}"
  end

  def format_vip_attributes
    self.title = self.title.titleize
    self.house = self.house.titleize
    self.town = self.town.titleize
    self.post_code = self.post_code.upcase
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def vip_member
    is_admin != true
  end

  # these states are those that Chargify considers to be safe, meaning
  # your users should still be able to login to your application
  ACTIVE_STATES = ['pending', 'trialing', 'assessing', 'active', 'soft_failure', 'past_due']
  # this method will almost always be unique to the application itself,
  # but I wanted to show an example implementation just in case it's useful
  def self.init!(user_token, subscription_id, account_state = 'pending')
    user = User.find_by_token(user_token)
    user.chargify_subscription_id = subscription_id
    unless user.active?
      user.state = account_state
    end
    return user
  end

  # a series of example convenience methods.....
  def chargify_subscriber_id
    @subscriber_id ||= Chargify::Subscription.find_by_customer_reference(self.user.token).id
  end

  def active?
    ACTIVE_STATES.include?(self.state)
  end

  def inactive?
    !self.active?
  end
end
