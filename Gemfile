source "http://rubygems.org"

gem "rails", "~> 3.1.3"

gem "jquery-rails"
gem "omniauth", "~> 1.0.0"
gem "omniauth-openid", "~> 1.0.1"
gem "omniauth-twitter", "~> 0.0.7"
gem "omniauth-github", "~> 1.0.0"
gem "cancan", "~> 1.6.7"
gem "rdiscount", "~> 1.6.8"
gem "kaminari", "~> 0.12.4"
gem "thinking-sphinx", "~> 2.0.10"
gem "backup", "~> 3.0.19"

group :development, :test do
  gem "sqlite3", "~> 1.3.4"
  gem "rspec-rails", "~> 2.7.0"
end

group :test do
  gem "factory_girl_rails", "~> 1.4.0"
end

group :staging, :production do
  gem "mysql2", "~> 0.3.10"
  gem "exception_notification", "~> 2.5.2"
end