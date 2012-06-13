if Rails.env.development?
   CarrierWave.configure do |config|
     config.storage = :fog     
     config.fog_credentials = {
         :provider               => 'AWS',
         :aws_access_key_id      => 'AKIAIPHZNJZ5QBOUOTHA',
         :aws_secret_access_key  => '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',
       }
       config.fog_directory  = 'altimarc-dev'
   end
end

if Rails.env.staging?
   CarrierWave.configure do |config|
     config.storage = :fog     
     config.fog_credentials = {
         :provider               => 'AWS',
         :aws_access_key_id      => 'AKIAIPHZNJZ5QBOUOTHA',
         :aws_secret_access_key  => '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',
       }
       config.fog_directory  = 'altimarc-staging'
   end
end

if Rails.env.production?
   CarrierWave.configure do |config|
     config.storage = :fog     
     config.fog_credentials = {
         :provider               => 'AWS',
         :aws_access_key_id      => 'AKIAIPHZNJZ5QBOUOTHA',
         :aws_secret_access_key  => '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',
       }
       config.fog_directory = 'altimarc'
   end
end