source 'http://rubygems.org'

gem 'rails', '3.2.1'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "haml", ">= 3.1.4"
gem "devise", ">= 2.0.0"
gem "bootstrap-sass"
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
gem 'aws-sdk'

group :development do
  #TODO: switch to postgres in the future -Lance
  gem 'mysql'
  gem "haml-rails", ">= 0.3.4"
  gem 'rb-fsevent'
  gem 'growl'
  gem "heroku"
  gem "guard", ">= 0.6.2"
  gem "guard-bundler", ">= 0.1.3"
  gem "guard-rails", ">= 0.0.3"
  gem "guard-livereload", ">= 0.3.0"
  gem "guard-rspec", ">= 0.4.3"
  gem "guard-cucumber", ">= 0.6.1"
end

group :test do
  gem "factory_girl_rails", ">= 1.6.0"
  gem "cucumber-rails", ">= 1.2.1"
  gem "capybara", ">= 1.1.2"
  gem "database_cleaner", ">= 0.7.1"
  gem "launchy", ">= 2.0.5"
end

group :production do
  gem 'therubyracer-heroku'
  gem 'pg'
end

gem "rspec-rails", ">= 2.8.1", :group => [:development, :test]

