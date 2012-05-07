# This file should contain all the record creation needed to seed the database with its default values.

puts "***SETTING UP ADMIN USER LOGIN***"
user = User.create! :first_name => "Lance", :last_name => "Ennen", :email => "admin@altimarc.com", :password => "please", :password_confirmation => "please", :role => "admin"
puts "New user created: " << user.email
puts "Password: " << user.password
puts ""


puts "***CREATING CHANNELS***"
background_dir = Rails.root.join('creatives', 'channels', 'background')
banner_dir = Rails.root.join('creatives', 'channels', 'banner')
channel = Channel.create(:id => "1", :name => "Randy Owen", :subdomain => "randy-owen", :description => "The legendary Randy Owen of Alabama takes you behind the scenes both in concert and in real life. Concerts, backstage access, custom games and trips money can't buy. Plus, some up close and personal access to Randy, his family and his down home Ft Payne, Alabama life. All this plus scheduled live performances!")
Channel.create(:id => "2", :name => "Mark Collie", :subdomain => "mark-collie", :background_color => "000000", :banner_image => File.new(File.join(banner_dir, 'mark-collie.jpg')), :background_image => File.new(File.join(background_dir, 'mark-collie.png')), :description => "After 113 years, the state of Tennessee closed Brushy Mountain State Penitentiary in June of 2009.  But not before country music icon Mark Collie took a two year journey inside the walls of this legendary place.  While there, he learned the stories and spoke to most of the population housed there.  What emerged was music that many liken to the late Johnny Cash.  This is true Americana and the world now can access the music and an upcoming world premiere feature recorded live from the prison.  Experience it here.")
Channel.create(:id => "3", :name => "Sam Phillips", :subdomain => "sam-phillips", :description => "Legendary music entrepreneur, and Sun records founder, Sam Phillips believed in music with no limits.  Tearing down racial barriers and launching careers for great artists such as BB King, Howlin Wolf, Elvis Presley, Carl Perkins, Johnny Cash, Jerry Lee Lewis, Charlie Rich, Roy Orbison and many more. That's what you will find right here. Rock-N-Roll Swag, behind the scenes footage, live performances and exclusive interviews revealing untold stories on the history of Rock-N-Roll and it's continuing influence on modern music.")
Channel.create(:id => "4", :name => "American Music Now", :subdomain => "american-music-now", :description => "American music has never been hotter and this channel will introduce you to music made by artists like Megan Mullins, Seth Hopkins and Ashton Shepherd. Our New Music Now Channel gives you the opportunity to hear their music, learn their stories of life and meet them up close and personal in ways you never imagined. This is music made in America and played for the planet.")
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
