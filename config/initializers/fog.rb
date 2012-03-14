CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJNKAOXCJMILUOVSQ',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'eu-west-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = '48harleystreetmembers'                 # required
  config.fog_public = false
end
