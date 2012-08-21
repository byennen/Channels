after :users do
  puts "***SETTING UP CHANNEL MASTER USER LOGIN***"
  user = User.create! :first_name => "Alison", :last_name => "Owen", :email => "channel@altimarc.com", :password => "please", :password_confirmation => "please", :role => "channel_master", :channel_id => "1"
  puts "New channel master user created: " << user.email
  puts "Password: " << user.password
  puts ""
end
