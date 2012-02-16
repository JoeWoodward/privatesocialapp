class FaqsController < ApplicationController
  before_filter :require_login
  before_filter :orientation

  def index
    @faqs = Faq.where(:active => true)
  end
end
