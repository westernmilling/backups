set :job_template, nil
set :output, "cron_log.log"

job_type :backup, "cd :path && bundle exec backup perform --trigger :task --config_file config.rb :output"

every 1.day, :at => '1:00 am' do
  backup 'database'
end
