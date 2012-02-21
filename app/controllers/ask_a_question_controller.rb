class AskAQuestionController < ApplicationController
  skip_before_filter :require_login
  before_filter :orientation
  before_filter :check_message, :only => :create

  def new
  end

  def create
    AskAQuestionMailer.the_users_question(current_user.full_name, current_user.email, params[:question]).deliver
    redirect_to faqs_path, :notice => 'Your question has been submitted, we will answer as soon as possible'
  end

  protected

  def check_message
    if params[:question].blank?
      flash.now[:failure] = 'Please supply a question'
      render :new
    end
  end
end
