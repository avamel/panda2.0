require "resque/tasks"

task "resque:setup" => :environment

namespace :resque do
  task :setup do
    require 'resque'
    Resque.redis = 'localhost:6379'
  end
end