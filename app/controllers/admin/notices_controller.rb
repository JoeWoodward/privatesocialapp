class Admin::NoticesController < Admin::ApplicationController
  before_filter :require_login
  before_filter :is_admin

  def index
    @notices = Notice.page(params[:page]).per(15)
  end

  def show
    @notice = Notice.find(params[:id])
    if @notice.user_id
      @author = User.find(@notice.user_id)
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to admin_notices_path
  end
end
