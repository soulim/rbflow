source 'http://rubygems.org'

gem 'rails', '3.0.3'

gem 'jquery-rails'
gem 'omniauth'
gem 'cancan'
gem 'rdiscount'

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'rspec-rails'
end

group :test do
  gem 'rspec'
	gem 'factory_girl'
end

group :production do
  gem 'mysql2'
  gem 'exception_notification', :git => 'git://github.com/rails/exception_notification', :require => 'exception_notifier'
end