# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :heroku do
  desc 'restarts all the heroku dynos so we can control when they restart'
  task :implode do
        heroku.post_ps_restart(ENV["shaboo"])
  end
end