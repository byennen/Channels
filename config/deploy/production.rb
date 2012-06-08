role :app, "107.22.185.71"                          # Your HTTP server, Apache/etc
role :db, "107.22.185.71", :primary => true
set :branch, :master
set :rails_env, "production"