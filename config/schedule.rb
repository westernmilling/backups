env :PATH, '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin'
set :output, 'cron.log'

job_type :backup, "cd :path && bundle exec backup perform --trigger :task --config_file config.rb :output"

every 1.day, :at => '1:00 am', roles: [:mysql] do
  backup 'mysql'
end

every 1.day, :at => '1:00 am', roles: [:pg] do
  backup 'postgres'
end
