require 'chargify_api_ares'

begin

  Chargify.configure do |c|
    c.subdomain = ENV['CHARGIFY_SUBDOMAIN']
    c.api_key = ENV['CHARGIFY_API_KEY']
  end

rescue
  nil
end
