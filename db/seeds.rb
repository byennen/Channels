# This file should contain all the record creation needed to seed the database with its default values.

puts "***SETTING UP ADMIN USER LOGIN***"
user = User.create! :first_name => "Lance", :last_name => "Ennen", :email => "admin@altimarc.com", :password => "please", :password_confirmation => "please", :role => "admin"
puts "New user created: " << user.email
puts "Password: " << user.password
puts ""

puts "***CREATING CHANNELS***"
background_dir = Rails.root.join('creatives', 'channels', 'background')
banner_dir = Rails.root.join('creatives', 'channels', 'banner')
channel = Channel.create(:id => "1", :name => "Randy Owen", :subdomain => "randy-owen", :banner_image => File.new(File.join(banner_dir, 'randy-owen.jpg')), :description => "The legendary Randy Owen of Alabama takes you behind the scenes both in concert and in real life. Concerts, backstage access, custom games and trips money can't buy. Plus, some up close and personal access to Randy, his family and his down home Ft Payne, Alabama life. All this plus scheduled live performances!")
Channel.create(:id => "2", :name => "Mark Collie", :subdomain => "mark-collie", :background_color => "000000", :banner_image => File.new(File.join(banner_dir, 'mark-collie.jpg')), :background_image => File.new(File.join(background_dir, 'mark-collie.png')), :description => "After 113 years, the state of Tennessee closed Brushy Mountain State Penitentiary in June of 2009.  But not before country music icon Mark Collie took a two year journey inside the walls of this legendary place.  While there, he learned the stories and spoke to most of the population housed there.  What emerged was music that many liken to the late Johnny Cash.  This is true Americana and the world now can access the music and an upcoming world premiere feature recorded live from the prison.  Experience it here.")
Channel.create(:id => "3", :name => "Sam Phillips", :subdomain => "sam-phillips", :background_color => "FFFFFF", :banner_image => File.new(File.join(banner_dir, 'sam-phillips.png')), :description => "Legendary music entrepreneur, and Sun records founder, Sam Phillips believed in music with no limits.  Tearing down racial barriers and launching careers for great artists such as BB King, Howlin Wolf, Elvis Presley, Carl Perkins, Johnny Cash, Jerry Lee Lewis, Charlie Rich, Roy Orbison and many more. That's what you will find right here. Rock-N-Roll Swag, behind the scenes footage, live performances and exclusive interviews revealing untold stories on the history of Rock-N-Roll and it's continuing influence on modern music.")
puts ""

puts "***SETTING UP CHANNEL MASTER USER LOGIN***"
user = User.create! :first_name => "Alison", :last_name => "Owen", :email => "channel@altimarc.com", :password => "please", :password_confirmation => "please", :role => "channel_master", :channel_id => "1"
puts "New channel master user created: " << user.email
puts "Password: " << user.password
puts ""

puts "***CREATING ALBUMS***"
album_dir = Rails.root.join('creatives', 'albums')
album = Album.create(:channel => channel, :title => "Demo", :description => "Demo", :price => "9.99", :active => true, :image => File.new(File.join(album_dir, 'brushy-mountain/mark-collie.png')) )
puts ""

puts "***CREATING SONGS***"
Song.create(:album => album, :title => "Breaking Bad", :active => true, :price => "1.00").uploads.create(:file_name => "song.mp3")
Song.create(:album => album, :title => "D.V.N.O.", :active => true, :price => "1.00").uploads.create(:file_name => "dvno.mp3")
Song.create(:album => album, :title => "Genesis", :active => true, :price => "1.00").uploads.create(:file_name => "genesis.mp3")
Song.create(:album => album, :title => "Threee Paaarrrtyyy", :active => true, :price => "1.00").uploads.create(:file_name => "party.mp3")
puts ""

puts "***CREATING VIDEOS***"
video = Video.create(:channel => channel, :title => "This is a movie demo", :description => "Description")
puts ""

puts "***CREATING VIDEO UPLOADS***"
video.uploads.create(:file_name => "movie.mov")
puts ""

puts "***CREATING VAULT***"
vault = Vault.create(:channel => channel)
puts ""

puts "***CREATING VAULT CONTENTS***"
vault.contents.create(:title => "movie.mov")
puts ""

puts "***CREATING EVENTS**"
event = Event.create(:channel => channel)
puts ""

puts "***CREATING EVENT CONTENTS***"
event.contents.create(:title => "movie.mov")
puts ""

puts "***CREATING POST***"
post = Post.create(:channel => channel)
puts ""

puts "***CREATING POST CONTENTS***"
post.contents.create(:title => "movie.mov")
puts ""

puts "***CREATING LIFE***"
life = Life.create(:channel => channel)
puts ""

puts "***CREATING LIFE CONTENTS***"
life.contents.create(:title => "movie.mov")
puts ""

puts "***CREATING GIVE***"
give = Give.create(:channel => channel)
puts ""

puts "***CREATING GIVE CONTENTS***"
give.contents.create(:title => "movie.mov")
puts ""

puts "***ADDING INTRO***"
#Song.create(:title => "Welcome to Altimarc", :filename => "song.mp3", :active => true, :intro => true)
