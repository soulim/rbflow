# Read more about backup gem on https://github.com/meskyanichi/backup

require 'yaml'

RAILS_ENV = ENV['RAILS_ENV'] || 'development'

database_config = YAML.load_file File.expand_path('../config/database.yml',  __FILE__)
backup_config   = YAML.load_file File.expand_path('../config/backup.yml',  __FILE__)
mail_config   = YAML.load_file File.expand_path('../config/mail.yml',  __FILE__)

Backup::Model.new(:db_backup, 'Database Backup to S3') do

  database MySQL do |db|
    db.name               = database_config[RAILS_ENV]["database"]
    db.username           = database_config[RAILS_ENV]["username"]
    db.password           = database_config[RAILS_ENV]["password"]
    db.host               = database_config[RAILS_ENV]["host"]
    db.port               = database_config[RAILS_ENV]["port"]
    db.skip_tables        = []
  end

  store_with S3 do |s3|
    s3.access_key_id      = backup_config[RAILS_ENV]["s3"]["access_key_id"]
    s3.secret_access_key  = backup_config[RAILS_ENV]["s3"]["secret_access_key"]
    s3.region             = backup_config[RAILS_ENV]["s3"]["region"]
    s3.bucket             = backup_config[RAILS_ENV]["s3"]["bucket"]
    s3.path               = backup_config[RAILS_ENV]["s3"]["path"]
    s3.keep               = backup_config[RAILS_ENV]["s3"]["keep"]
  end

  compress_with Gzip do |compression|
    compression.best = true
    compression.fast = false
  end
  
  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_failure           = true

    mail.from                 = mail_config[RAILS_ENV]["smtp_settings"]["user_name"]
    mail.to                   = mail_config[RAILS_ENV]["default_recipient"]
    mail.address              = mail_config[RAILS_ENV]["smtp_settings"]["address"]
    mail.port                 = mail_config[RAILS_ENV]["smtp_settings"]["port"]
    mail.domain               = mail_config[RAILS_ENV]["smtp_settings"]["domain"]
    mail.user_name            = mail_config[RAILS_ENV]["smtp_settings"]["user_name"]
    mail.password             = mail_config[RAILS_ENV]["smtp_settings"]["password"]
    mail.authentication       = mail_config[RAILS_ENV]["smtp_settings"]["authentication"]
    mail.enable_starttls_auto = mail_config[RAILS_ENV]["smtp_settings"]["enable_starttls_auto"]
  end

end