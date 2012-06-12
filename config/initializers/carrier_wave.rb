if Rails.env.test? or Rails.env.development?
   CarrierWave.configure do |config|
     config.storage :file
   end
end

if Rails.staging?
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

if Rails.production?
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