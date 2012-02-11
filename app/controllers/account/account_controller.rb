class Account::AccountController < ApplicationController
  layout 'account'

  before_filter :orientation

  private

  #override this variable inside controllers or actions
  #change value to 'vertical' .. obviously!

  #css defitions exist for .horizontal-wrapper and 
  #.vertical-wrapper
  def orientation

    # set default layout to vertical
    # @orientation is used in the layout..
    # HAML: %div{class: "#{@orientation}-wrapper"}
    @orientation = 'vertical'
  end
end
