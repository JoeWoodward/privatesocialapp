require 'digest/md5'

class Chargify::HooksController < ApplicationController
  skip_before_filter :require_login
  skip_before_filter :is_user_authorised
  protect_from_forgery :except => :dispatch_handler
  before_filter :verify, :only => :dispatch_handler

  EVENTS = %w[ test signup_success signup_failure renewal_success renewal_failure payment_success payment_failure billing_date_change subscription_state_change subscription_product_change ].freeze

  def dispatch_handler
    event = params[:event]

    unless EVENTS.include? event
      render :nothing => true, :status => 404 and return
    end

    begin
      convert_payload
      self.send event
    rescue Exception => e
      render :nothing => true, :status => 422 and return
    end
  end

  def test
    Rails.logger.debug "Chargify Webhook test!"
      render :nothing => true, :status => 200
  end

  def signup_success
      render :nothing => true, :status => 200
  end

  def signup_failure
      render :nothing => true, :status => 200
  end

  def renewal_success
      render :nothing => true, :status => 200
  end

  def renewal_failure
      render :nothing => true, :status => 200
  end

  def payment_success
      render :nothing => true, :status => 200
  end

  def payment_failure
      render :nothing => true, :status => 200
  end

  def billing_date_change
      render :nothing => true, :status => 200
  end

  def subscription_state_change
      render :nothing => true, :status => 200
  end

  def subscription_product_change
      render :nothing => true, :status => 200
  end

  protected
  def verify
    if params[:signature].nil?
      params[:signature] = request.headers["HTTP_X_CHARGIFY_WEBHOOK_SIGNATURE"]
    end


    unless MD5::hexdigest(self.site_key + request.raw_post) == params[:signature]
      render :nothing => true, :status => :forbidden
     end
  end

  def convert_payload
    if params[:payload].has_key? :transaction
      @transaction = Chargify::Transaction.new params[:payload][:transaction]
    end

    if params[:payload].has_key? :subscription
      @subscription = Chargify::Subscription.new params[:payload][:subscription]
    end
  end

  private
  def self.chargify_config
    YAML::load_file(File.join(Rails.root, 'config', 'chargify.yml'))
  end

  def self.site_key
    self.chargify_config[Rails.env]['site_key']
  end
end
