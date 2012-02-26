class StaticPagesController < ApplicationController
  skip_before_filter :require_login
  skip_before_filter :is_user_authorised

  def home
    @user = User.new
    redirect_to your_details_path if current_user
    @section_style = 'half-width-translucent'
    @content_holder = 'your-content sign-up'
    render layout: 'signup'
  end

  def privacy
  end

  def terms
  end
end
