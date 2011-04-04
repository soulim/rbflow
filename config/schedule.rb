# Use this file to easily define all of your cron jobs.
#
# Learn more: http://github.com/javan/whenever

every 1.day, :at => '01:01' do
  rake 'db:backup'
end


