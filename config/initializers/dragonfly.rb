require 'dragonfly'
app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)
if Rails.env.development?
  app.configure do |c|
    c.datastore = Dragonfly::DataStorage::S3DataStore.new(
      :bucket_name => APP_CONFIG['aws_bucket'],
      :access_key_id => APP_CONFIG['aws_access_key'],
      :secret_access_key => APP_CONFIG['aws_secret_access_key']
    )
    c.convert_command = "/usr/local/bin/convert"          # defaults to "convert"
    c.identify_command = "/usr/local/bin/identify"        # defaults to "identify"
  end
end

if Rails.env.production? || Rails.env.staging?
  app.configure do |c|
    c.datastore = Dragonfly::DataStorage::S3DataStore.new(
      :bucket_name => APP_CONFIG['aws_bucket'],
      :access_key_id => APP_CONFIG['aws_access_key'],
      :secret_access_key => APP_CONFIG['aws_secret_access_key']
    )
  end
end

app.define_macro(ActiveRecord::Base, :image_accessor)