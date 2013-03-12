web: bundle exec unicorn config.ru -c config/unicorn.rb -p $PORT -E $RAILS_ENV
search: searchd --nodetach --pidfile --config config/$RAILS_ENV.sphinx.conf