class Admin::FaqsController < Admin::ApplicationController
  before_filter :require_login
  before_filter :is_admin

  def index
    @faqs = Faq.all
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def new
    @faq = Faq.new
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def create
    @faq = Faq.new(params[:faq])
    if @faq.save
      redirect_to admin_faq_path(@faq), notice: 'FAQ was successfully created.'
    else
      render :new
    end
  end

  def update
    @faq = Faq.find(params[:id])
    if @faq.update_attributes(params[:faq])
      redirect_to admin_faq_path(@faq), notice: 'FAQ was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy
    redirect_to admin_faqs_path
  end
end
