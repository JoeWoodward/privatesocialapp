class AskAQuestionController < ApplicationController
  before_filter :orientation
  before_filter :check_message, :only => :create

  def new
  end

  def create
    AskAQuestionMailer.the_users_question(current_user.full_name, current_user.email, params[:question]).deliver
    flash[:success] = 'Your question has been submitted, we will answer as soon as possible'
    redirect_to faqs_path
  end

  protected

  def check_message
    if params[:question].blank?
      flash.now[:failure] = 'Please supply a question'
      render :new
    end
  end
end
