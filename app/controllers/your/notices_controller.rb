class Your::NoticesController < Your::YourController
  before_filter :notice_is_users, :only => [:show, :edit, :update, :destroy]

  def index
    @notices = current_user.notices
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
    @notice = current_user.notices.build(params[:notice])
    @notice.activated = false
    if @notice.save
      UserMailer.new_notice(@notice).deliver
      redirect_to your_notice_path(@notice), notice: 'Notice was successfully created.'
    else
      render :new
    end
  end

  def update
    @notice = Notice.find(params[:id])
    if @notice.update_attributes(params[:notice])
      redirect_to your_notice_path(@notice), notice: 'Notice was successfully created.'
    else
      render :edit
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to your_notices_path
  end

  private

  def notice_is_users
    unless current_user.notices.include?(Notice.find(params[:id]))
      redirect_to your_notices_path
    end
  end
end
