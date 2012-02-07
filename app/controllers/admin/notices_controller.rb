class Admin::NoticesController < Admin::ApplicationController
  before_filter :require_login
  before_filter :is_admin

  def index
    @notices = Notice.all
  end

  def show
    @notice = Notice.find(params[:id])
  end

  def new
    @notice = Notice.new
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def create
    @notice = Notice.new(params[:notice])
    if @notice.save
      redirect_to admin_notice_path(@notice), notice: 'Notice was successfully created.'
    else
      render :new
    end
  end

  def update
    @notice = Notice.find(params[:id])
    if @notice.update_attributes(params[:notice])
      redirect_to admin_notice_path(@notice)
    else
      render edit_admin_notice_path(@notice)
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to admin_notices_path
  end
end
