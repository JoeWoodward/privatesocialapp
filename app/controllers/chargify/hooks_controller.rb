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
    begin
      @user = User.find_by_token(@subscription.customer.reference)
      @user.chargigy_subscription_id = @subscription.id
      @user.state = @subscription.state
      @user.subscription_billing_date = @subscription.current_period_ends_at
      @user.save(:validate => false)
      render :nothing => true, :status => 200
    rescue Exception => e
      render :nothing => true, :status => 422 and return
    end
  end

  def signup_failure
    begin
      @user = User.find_by_token(@subscription.customer.reference)
      @user.state = @subscription.state
      @user.chargigy_subscription_id = @subscription.id
      @user.subscription_billing_date = @subscription.current_period_ends_at
      @user.save(:validate => false)
      render :nothing => true, :status => 200
    rescue Exception => e
      render :nothing => true, :status => 422 and return
    end
  end

  def renewal_success
    begin
      @user = User.find_by_token(@subscription.customer.reference)
      @user.state = @subscription.state
      @user.chargigy_subscription_id = @subscription.id
      @user.subscription_billing_date = @subscription.current_period_ends_at
      @user.save(:validate => false)
      render :nothing => true, :status => 200
    rescue Exception => e
      render :nothing => true, :status => 422 and return
    end
  end

  def renewal_failure
    begin
      @user = User.find_by_token(@subscription.customer.reference)
      @user.state = @subscription.state
      @user.chargigy_subscription_id = @subscription.id
      @user.subscription_billing_date = @subscription.current_period_ends_at
      @user.save(:validate => false)
      render :nothing => true, :status => 200
    rescue Exception => e
      render :nothing => true, :status => 422 and return
    end
  end

  def payment_success
    begin
      @user = User.find_by_token(@subscription.customer.reference)
      @user.state = @subscription.state
      @user.chargigy_subscription_id = @subscription.id
      @user.subscription_billing_date = @subscription.current_period_ends_at
      @user.save(:validate => false)
      render :nothing => true, :status => 200
    rescue Exception => e
      render :nothing => true, :status => 422 and return
    end
  end

  def payment_failure
    begin
      @user = User.find_by_token(@subscription.customer.reference)
      @user.state = @subscription.state
      @user.chargigy_subscription_id = @subscription.id
      @user.subscription_billing_date = @subscription.current_period_ends_at
      @user.save(:validate => false)
      render :nothing => true, :status => 200
    rescue Exception => e
      render :nothing => true, :status => 422 and return
    end
  end

  def billing_date_change
    begin
      @user = User.find_by_token(@subscription.customer.reference)
      @user.state = @subscription.state
      @user.chargigy_subscription_id = @subscription.id
      @user.subscription_billing_date = @subscription.current_period_ends_at
      @user.save(:validate => false)
      render :nothing => true, :status => 200
    rescue Exception => e
      render :nothing => true, :status => 422 and return
    end
  end

  def subscription_state_change
    begin
      @user = User.find_by_token(@subscription.customer.reference)
      @user.state = @subscription.state
      @user.chargigy_subscription_id = @subscription.id
      @user.subscription_billing_date = @subscription.current_period_ends_at
      @user.save
      render :nothing => true, :status => 200
    rescue Exception => e
      render :nothing => true, :status => 422 and return
    end
  end

  def subscription_product_change
      render :nothing => true, :status => 200
  end

  protected
  def verify
    if params[:signature].nil?
      params[:signature] = request.headers["HTTP_X_CHARGIFY_WEBHOOK_SIGNATURE"]
    end


    unless Digest::MD5.hexdigest(site_key + request.raw_post) == params[:signature]
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

  def site_key
    ENV['CHARGIFY_SITE_KEY']
  end
end
