class StaticPagesController < ApplicationController
  skip_before_filter :require_login
  skip_before_filter :is_user_authorised
  layout 'signup'

  def home
    unless current_user
      @user = User.new
      @section_style = 'half-width-translucent'
      @content_holder = 'sign-up-content sign-up'
    else
      redirect_to offers_path
    end
  end

  def privacy
    @section_style = 'half-width-translucent'
    @content_holder = 'sign-up-content sign-up'
  end

  def terms
    @section_style = 'half-width-translucent'
    @content_holder = 'sign-up-content sign-up'
  end
end
