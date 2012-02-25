class Your::YourController < ApplicationController
  include WhichCssClassToUse

  # I included this controller so that 
  # all /your/:resources would have the 
  # 'your' layout
  layout 'your'
end
