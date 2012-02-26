class StaticPagesController < ApplicationController
  skip_before_filter :require_login
  skip_before_filter :is_user_authorised

  def home
    redirect_to your_details_path if current_user
  end

  def privacy
  end

  def terms
  end
end
