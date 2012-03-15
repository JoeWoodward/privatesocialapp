class Admin::NoticesController < Admin::ApplicationController
  before_filter :require_login
  before_filter :is_admin

  def index
    @notices = Notice.where(:activated => false).page(params[:page]).per(15)
  end

  def show
    @notice = Notice.find(params[:id])
    if @notice.activated? || !@notice
      redirect_to admin_notices_path, notice: 'The notice you are trying to access has already been approved'
    else
      if @notice.user_id
        @author = User.find(@notice.user_id)
      end
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to admin_notices_path
  end

  def activate
    @notice = Notice.find(params[:id])
    @notice.activated = true
    @notice.activated_at = Time.now
    if @notice.save
      redirect_to admin_notices_path, notice: "Successfully approved '#{@notice.title}'"
    end
  end
end
