class NoticesController < ApplicationController
  before_filter :require_login
  before_filter :orientation

  def index
    @notices = Notice.all
  end

  def show
    @notice = Notice.find(params[:id])
    @author = User.find(@notice.user_id)
  end
end

