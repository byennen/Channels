puts "***SETTING UP ADMIN USER LOGIN***"
user = User.create! :first_name => "Lance", :last_name => "Ennen", :email => "admin@altimarc.com", :password => "please", :password_confirmation => "please", :role => "admin"
puts "New user created: " << user.email
puts "Password: " << user.password
puts ""
