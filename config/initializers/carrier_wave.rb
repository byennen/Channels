CarrierWave.configure do |config|
  config.storage = :fog     
   config.fog_credentials = {
     :provider               => 'AWS',
     :aws_access_key_id      => APP_CONFIG['aws_access_key'],
     :aws_secret_access_key  => APP_CONFIG['aws_secret_access_key'],
   }
   config.fog_directory  = APP_CONFIG['aws_bucket']
   if Rails.env.production?
     config.fog_host = 'http://assets.altimarc.com'
   end
end