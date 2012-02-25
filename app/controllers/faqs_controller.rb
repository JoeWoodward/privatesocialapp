class FaqsController < ApplicationController
  def index
    @faqs = Faq.where(:active => true)
  end
end
