source 'http://rubygems.org'

gem 'rails', '3.2.1'

gem 'jquery-rails'
gem "haml", ">= 3.1.4"
gem "devise", ">= 2.0.0"
gem 'aws-sdk'
gem "rack-pjax"
gem "mail"
gem "twitter-bootstrap-rails"

group :assets do
  #TODO: remove sass -Lance
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  #TODO: switch to postgres in the future -Lance
  gem 'mysql'
  gem "heroku"
  gem "thin" #fix log for ruby 1.9.3 until its cleaned up - rails s thin
  gem 'pry-rails'
end

group :development, :test do
  gem "rspec-rails", ">= 2.8.1"
  gem "factory_girl_rails", ">= 1.6.0"
  gem "cucumber-rails", ">= 1.2.1"
  gem "capybara", ">= 1.1.2"
  gem "database_cleaner", ">= 0.7.1"
  gem "launchy", ">= 2.0.5"
end

group :production do
  gem 'pg'
end



