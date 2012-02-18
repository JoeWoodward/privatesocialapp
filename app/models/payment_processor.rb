class PaymentProcessor
  # used for the initial signup flow
  def self.hosted_signup_page_for(user)

    #89581 is the id of the product, if there was more than one product we couldn't hardcode this!
    "https://#{self.subdomain}.chargify.com/h/89581/subscriptions/new?first_name=#{user.first_name}&last_name=#{user.last_name}&email=#{user.email}&reference=#{user.token}"
  end

  # used to send a user to their unique payment page in
  # the event that they need to update their payment details
  def self.update_payment_url_for(user)
    "https://#{self.subdomain}.chargify.com/update_payment/#{user.chargify_subscription_id}/#{self.secure_digest(["update_payment", user.chargify_subscription_id, self.site_key].join("--"))[0..9]}"
  end

private

  def self.chargify_config
    YAML::load_file(File.join(Rails.root, 'config', 'chargify.yml'))
  end

  def self.site_key
    self.chargify_config[Rails.env]['site_key']
  end

  def self.subdomain
    self.chargify_config[Rails.env]['subdomain']
  end

  def self.secure_digest(*args)
    Digest::SHA1.hexdigest(*args)
  end

end
