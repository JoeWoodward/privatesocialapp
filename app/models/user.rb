class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :first_name, :last_name, :email, :password_confirmation, :password

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :password, :on => :create
  validates_presence_of :password_confirmation, :on => :create

  validates_confirmation_of :password

  validates_uniqueness_of :email
end
