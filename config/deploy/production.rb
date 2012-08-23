role :app, "107.22.185.71"                          # Your HTTP server, Apache/etc
role :db, "107.22.185.71", :primary => true
role :resque_worker, "107.22.185.71"
set :branch, :master
set :rails_env, "production"
set :deploy_to, "/mnt/apps/#{application}"
after "deploy:restart", "resque:restart"