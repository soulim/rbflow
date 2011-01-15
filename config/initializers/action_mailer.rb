# ActionMailer setup
config = YAML.load_file(File.join(Rails.root, "config", "mail.yml"))[Rails.env].symbolize_keys

ActionMailer::Base.smtp_settings              = config[:smtp_settings].symbolize_keys
ActionMailer::Base.default_url_options[:host] = config[:host]
