role :app, "107.21.119.78"                          # Your HTTP server, Apache/etc
role :db, "107.21.119.78", :primary => true
set :branch, :staging
set :rails_env, "staging"