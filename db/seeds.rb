# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :first_name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.first_name
puts ""
puts "Creating Channels"
channel = Channel.create(:name => "Randy Owen", :subdomain => "randy-owen")
Channel.create(:name => "Mark Collie", :subdomain => "mark-collie")
Channel.create(:name => "Sam Phillips", :subdomain => "sam-phillips")
puts "Creating songs"
Song.create(:channel => channel, :title => "Breaking Bad", :filename => "song.mp3", :active => true)
Song.create(:channel => channel, :title => "D.V.N.O.", :filename => "dvno.mp3", :active => true)
Song.create(:channel => channel, :title => "Genesis", :filename => "genesis.mp3", :active => true)
Song.create(:channel => channel, :title => "Threee Paaarrrtyyy", :filename => "party.mp3", :active => true)
