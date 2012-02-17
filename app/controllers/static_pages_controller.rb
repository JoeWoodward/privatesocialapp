class StaticPagesController < ApplicationController
  before_filter :orientation

  def home
    redirect_to your_details_path if current_user
  end
end
