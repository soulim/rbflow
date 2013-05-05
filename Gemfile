source "https://rubygems.org"

gem "rails", "~> 3.2.13"

gem "jquery-rails", "~> 2.2.1"
gem "omniauth", "~> 1.1.4"
gem "omniauth-openid", "~> 1.0.1"
gem "omniauth-twitter", "~> 0.0.16"
gem "omniauth-github", "~> 1.1.0"
gem "cancan", "~> 1.6.9"
gem "rdiscount", "~> 2.0.7.2"
gem "kaminari", "~> 0.14.1"
gem "pg", "~> 0.15.1"
gem "textacular", "~> 3.0.0", require: "textacular/rails"
gem "foreman", "~> 0.63.0"
gem "unicorn", "~> 4.6.2"
gem "bugsnag", "~> 1.3.6"
gem "figaro", "~> 0.6.4"

group :assets do
  gem "therubyracer", "~> 0.11.4"
  gem "uglifier", "~> 2.0.1"
end

group :development, :test do
  gem "rspec-rails", "~> 2.13.1"
  gem "mina", :git => "git://github.com/nadarei/mina.git"
end

group :test do
  gem "factory_girl_rails", "~> 4.2.1"
end

group :production do
  gem "newrelic_rpm", "~> 3.6.1.88"
end