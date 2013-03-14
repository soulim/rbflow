ActionMailer::Base.smtp_settings = {
  :address => ENV['SMTP_ADDRESS'],
  :port => ENV['SMTP_PORT'],
  :user_name => ENV['SMTP_USERNAME'],
  :password => ENV['SMTP_PASSWORD']
}
ActionMailer::Base.default_url_options[:host] = ENV['SMTP_HOST']
