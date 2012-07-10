require 'capistrano/ext/multistage'
require "bundler/capistrano"
#require 'airbrake/capistrano'
require 'capistrano-resque'

set :application, "Channels"
set :user, "deploy"

set :stages, %w(production staging)
set :default_stage, "staging"

set :deploy_to, "/home/#{user}/#{application}"
set :use_sudo, false

default_run_options[:pty] = true

set :scm, "git"
set :repository, "git@github.com:altimarc/Channels.git"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true

# resque workers
set :workers, { "waveform_queue" => 1 }

# automatically called after a deploy
deploy.task :restart, :roles => :app do
  run "touch #{current_release}/tmp/restart.txt"
end

namespace(:customs) do
  task :config, :roles => :app do
    run <<-CMD
      ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml
    CMD
  end
end

after "deploy:update_code", "customs:config"
after "deploy", "deploy:cleanup"
after "deploy:restart", "resque:restart"

require './config/boot'
require 'airbrake/capistrano'
