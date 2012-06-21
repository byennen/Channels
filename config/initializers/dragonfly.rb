require 'dragonfly'
app = Dragonfly[:images]

app.configure_with(:imagemagick)
app.configure_with(:rails)
if Rails.env.development?
  app.configure do |c|
    c.datastore = Dragonfly::DataStorage::S3DataStore.new(
      :bucket_name => 'altimarc-dev',
      :access_key_id => 'AKIAIPHZNJZ5QBOUOTHA',
      :secret_access_key => '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'
    )
    c.convert_command = "/usr/local/bin/convert"          # defaults to "convert"
    c.identify_command = "/usr/local/bin/identify"        # defaults to "identify"
  end
end
if Rails.env.production?
  app.configure do |c|
    c.datastore = Dragonfly::DataStorage::S3DataStore.new(
      :bucket_name => 'altimarc-production',
      :access_key_id => 'AKIAIPHZNJZ5QBOUOTHA',
      :secret_access_key => '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'
    )
  end
end

if Rails.env.staging?
  app.configure do |c|
    c.datastore = Dragonfly::DataStorage::S3DataStore.new(
      :bucket_name => 'altimarc-staging',
      :access_key_id => 'AKIAIPHZNJZ5QBOUOTHA',
      :secret_access_key => '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'
    )
  end
end

app.define_macro(ActiveRecord::Base, :image_accessor)
