listen            '/tmp/unicorn.rubyflow.sock'
worker_processes  4
timeout           30
preload_app       true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end