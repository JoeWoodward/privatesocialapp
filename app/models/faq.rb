class Faq < ActiveRecord::Base
  extend FriendlyId
  friendly_id :question, use: :slugged

  validates_presence_of :question
  validates_presence_of :answer

  validates_uniqueness_of :question
end
