class ApplicationController < ActionController::Base
  protect_from_forgery
  include Orientation
  before_filter :require_login
  before_filter :is_user_authorised

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  # Render a templated "Not Found" page via app/views/custom_pages/404.html.haml
  def render_404
    render 'static_pages/404', :status => :not_found
    return true
  end

  private

  def not_authenticated
    redirect_to root_path
  end

  def is_user_authorised
    # check there is a user in session
    if current_user.present?
      #check the user is activated (has paid at least once)
      if current_user.state == nil && current_user.is_admin != true
        redirect_to your_details_path
      elsif current_user.inactive? && current_user.is_admin != true
        redirect_to your_details_path, "Please register to gain access to all the great features of 48 Harley Street VIP"
      end
    else
      not_authenticated
    end
  end
end
