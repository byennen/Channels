OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '186705001442650', 'fd2e9a3fa2c509c6b097fd7a9e5bd0bc'
end
