source "https://rubygems.org"

gem "rails", "~> 3.2.12"

gem "jquery-rails", "~> 2.2.1"
gem "omniauth", "~> 1.1.3"
gem "omniauth-openid", "~> 1.0.1"
gem "omniauth-twitter", "~> 0.0.14"
gem "omniauth-github", "~> 1.1.0"
gem "cancan", "~> 1.6.9"
gem "rdiscount", "~> 2.0.7.1"
gem "kaminari", "~> 0.14.1"
gem "thinking-sphinx", "~> 3.0.1"
gem "mysql2", "~> 0.3.12b6" # thinking-sphinx requires this gem
gem "foreman", "~> 0.62.0"
gem "unicorn", "~> 4.6.2"

group :assets do
  gem "uglifier", "~> 1.3.0"
end

group :development, :test do
  gem "sqlite3", "~> 1.3.7"
  gem "rspec-rails", "~> 2.13.0"
  gem "mina", "~> 0.2.1"
end

group :test do
  gem "factory_girl_rails", "~> 4.2.1"
end

group :production do
  gem "pg", "~> 0.14.1"
  gem "bugsnag", "~> 1.2.18"
  gem "newrelic_rpm", "~> 3.5.8.72"
end