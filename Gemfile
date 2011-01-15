source 'http://rubygems.org'

gem 'rails', '3.0.3'

gem 'jquery-rails'
gem 'omniauth'
gem 'cancan'
gem 'rdiscount'
gem "will_paginate", "~> 3.0.pre2"

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'rspec-rails'
end

group :test do
  gem 'rspec'
	gem 'factory_girl'
end

group :staging, :production do
  gem 'mysql2'
  gem 'exception_notification', :git => 'git://github.com/rails/exception_notification', :require => 'exception_notifier'
end