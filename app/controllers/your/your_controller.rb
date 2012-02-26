class Your::YourController < ApplicationController
  include WhichCssClassToUse
  before_filter :css_classes_please

  # I included this controller so that 
  # all /your/:resources would have the 
  # 'your' layout
  layout 'your'
end
