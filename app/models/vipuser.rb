class Vipuser < ActiveRecord::Base
  authenticates_with_sorcery!
end
