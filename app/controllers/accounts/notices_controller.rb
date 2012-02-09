class Accounts::NoticesController < ApplicationController
  before_filter :require_login
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
    if @notice.save
      redirect_to accounts_notice_path(@notice), notice: 'Notice was successfully created.'
    else
      render :new
    end
  end

  def update
    @notice = Notice.find(params[:id])
    if @notice.update_attributes(params[:notice])
      redirect_to accounts_notice_path(@notice), notice: 'Notice was successfully created.'
    else
      render edit_accounts_notice_path(@notice)
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to accounts_notices_path
  end

  private

  def notice_is_users
    unless current_user.notices.include?(Notice.find(params[:id]))
      redirect_to accounts_notices_path
    end
  end
end
