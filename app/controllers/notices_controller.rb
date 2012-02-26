class NoticesController < ApplicationController
  def index
    @notices = Notice.all

    # see WhichCssClassToUse Concern Module
    # this overrides .main-content's width
    @content_holder = 'noticeboard-holder'
  end

  def show
    @notice = Notice.find(params[:id])
    @author = User.find(@notice.user_id)
  end
end

