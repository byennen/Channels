source 'http://rubygems.org'

gem 'rails', '3.2.4'

gem 'jquery-rails'
gem 'haml', '>= 3.1.4'
gem 'devise', '>= 2.0.0'
gem 'cancan'
gem 'rack-pjax'
gem 'mail'
gem 'twitter-bootstrap-rails'
gem 'spine-rails'
gem 'newrelic_rpm'
gem 'thin'
gem 'simple_form'
gem 'stripe'

#uploads
gem 'rack-cache', :require => 'rack/cache'
gem 'dragonfly', '~>0.9.11'
gem 'fog'
gem 'aws-s3', :require => 'aws/s3'

group :test do
  gem 'rspec-rails', '>= 2.8.1'
  gem 'cucumber-rails', '>= 1.2.1', :require => false
  gem 'factory_girl_rails', '>= 1.6.0'
  gem 'capybara', '>= 1.1.2'
  gem 'database_cleaner', '>= 0.7.1'
  gem 'launchy', '>= 2.0.5'
end

group :assets do
  #TODO: remove sass -Lance
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  #TODO: switch to postgres in the future -Lance
  gem 'mysql'
  gem 'heroku'
  gem 'pry-rails'
end

group :production do
  gem 'pg'
end



