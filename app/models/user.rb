class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_presence_of :first_name
  validates_presence_of :last_name
end
