class Admin::VipUsersController < Admin::ApplicationController
  before_filter :require_login
  before_filter :is_admin

  def index
    @vip_users = User.where(:is_admin => [nil, false]).page(params[:page]).per(15)
  end

  def show
    @vip_user = User.find(params[:id])
  end
end
