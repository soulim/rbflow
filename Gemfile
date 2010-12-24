source 'http://rubygems.org'

gem 'rails', '3.0.3'

gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'jquery-rails'
gem 'omniauth'
gem 'rdiscount'

#group :development do
#  gem 'ruby-debug'
#end

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
end

group :test do
	gem 'factory_girl'
	gem 'shoulda'
end

group :production do
  gem 'mysql2'
  gem 'exception_notification', :git => 'git://github.com/rails/exception_notification', :require => 'exception_notifier'
end