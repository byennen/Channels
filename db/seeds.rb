# This file should contain all the record creation needed to seed the database with its default values.

#Delete Users
User.delete_all

puts "***SETTING UP ADMIN USER LOGIN***"
user = User.create! :first_name => "Lance", :last_name => "Ennen", :email => "admin@altimarc.com", :password => "please", :password_confirmation => "please", :role => "admin"
puts "New user created: " << user.email
puts "Password: " << user.password
puts ""


puts "***CREATING CHANNELS***"
channel = Channel.create(:name => "Randy Owen", :subdomain => "randy-owen")
Channel.create(:name => "Mark Collie", :subdomain => "mark-collie")
Channel.create(:name => "Sam Phillips", :subdomain => "sam-phillips")
puts ""


puts "***SETTING UP CHANNEL MASTER USER LOGIN***"
user = User.create! :first_name => "Alison", :last_name => "Owen", :email => "channel@altimarc.com", :password => "please", :password_confirmation => "please", :role => "channel_master", :channel_id => "1"
puts "New channel master user created: " << user.email
puts "Password: " << user.password
puts ""


puts "***CREATING SONGS***"
Song.create(:channel => channel, :title => "Breaking Bad", :filename => "song.mp3", :active => true)
Song.create(:channel => channel, :title => "D.V.N.O.", :filename => "dvno.mp3", :active => true)
Song.create(:channel => channel, :title => "Genesis", :filename => "genesis.mp3", :active => true)
Song.create(:channel => channel, :title => "Threee Paaarrrtyyy", :filename => "party.mp3", :active => true)
puts ""
