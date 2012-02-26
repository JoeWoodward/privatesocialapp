class NoticesController < ApplicationController
  def index
    @notices = Notice.order('created_at desc').limit(20)

    # see WhichCssClassToUse Concern Module
    # this overrides .main-content's width
    @content_holder = 'noticeboard-holder'
  end

  def show
    @notice = Notice.find(params[:id])
    @author = User.find(@notice.user_id)
  end
end

