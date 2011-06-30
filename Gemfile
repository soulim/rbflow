source 'http://rubygems.org'

gem 'rails', '3.0.9'

gem 'jquery-rails'
gem 'omniauth'
gem 'cancan'
gem 'rdiscount'
gem 'kaminari'
gem 'thinking-sphinx', :require => 'thinking_sphinx'
gem 'riddle'
gem 'riddle', :require => 'riddle/0.9.9'
gem 'backup'
gem 'backup-task'
gem 'fog'
gem 'whenever', :require => false

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
end

group :test do
	gem 'factory_girl_rails'
end

group :staging, :production do
  gem 'mysql2', '< 0.3'
  gem 'exception_notification', :require => 'exception_notifier'
end