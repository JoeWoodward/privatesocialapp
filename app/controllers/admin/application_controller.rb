class Admin::ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404


  def not_authenticated
    redirect_to admin_login_path, :notice => 'Please log in to access the administration area'
  end
  # Render a templated "Not Found" page via app/views/custom_pages/404.html.haml
  def render_404
    render 'static_pages/404', :status => :not_found
    return true
  end
end
