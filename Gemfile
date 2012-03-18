source "http://rubygems.org"

gem "rails", "~> 3.2.2"

gem "jquery-rails", "~> 2.0.1"
gem "omniauth", "~> 1.0.3"
gem "omniauth-openid", "~> 1.0.1"
gem "omniauth-twitter", "~> 0.0.8"
gem "omniauth-github", "~> 1.0.1"
gem "cancan", "~> 1.6.7"
gem "rdiscount", "~> 1.6.8"
gem "kaminari", "~> 0.13.0"
gem "thinking-sphinx", "~> 2.0.11"

group :assets do
  gem "uglifier", "~> 1.2.3"
end

group :development, :test do
  gem "sqlite3", "~> 1.3.5"
  gem "rspec-rails", "~> 2.9.0"
end

group :test do
  gem "factory_girl_rails", "~> 1.7.0"
end

group :staging, :production do
  gem "mysql2", "~> 0.3.11"
  gem "exception_notification", "~> 2.5.2"
end