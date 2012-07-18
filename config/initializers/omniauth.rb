OmniAuth.config.logger = Rails.logger

if Rails.env.development?
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '186705001442650', 'fd2e9a3fa2c509c6b097fd7a9e5bd0bc'
  end
end

if Rails.env.staging?
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '344575558914076', '23a4c1e2d05fef2d4e40101d6c58dd35'
  end
end

if Rails.env.production?
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '364007843633134', '09933ed43f8aabdb9e2bd6200f8e5006'
  end
end
