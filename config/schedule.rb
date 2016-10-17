set :output, "log/cron_log.log"
env :PATH, ENV['PATH']

every 1.minute do
    rake 'events:inactivatethem'
end
