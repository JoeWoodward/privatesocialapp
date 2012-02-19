class ApplicationController < ActionController::Base
  protect_from_forgery
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
    unless current_user.is_admin? || current_user.active?
      redirect_to your_details_path, "Please register to gain access to all the great features of 48 Harley Street VIP"
    end
  end
  #override this variable inside controllers or actions
  #change @orientation to 'horizontal' .. obviously!

  #css defitions exist for .horizontal-wrapper and 
  #.vertical-wrapper
  def orientation

    # set default layout to vertical
    # @orientation is used in the layout..
    # HAML: %div{class: "#{@orientation}-wrapper"}
    @orientation = 'vertical'
  end
end
