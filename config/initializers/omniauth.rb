OmniAuth.config.logger = Rails.logger


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, APP_CONFIG['facebook_app_id'], APP_CONFIG['facebook_app_secret'], scope: "email, publish_stream,publish_actions"
end
