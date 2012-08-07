after :users do
  background_dir = Rails.root.join('db', 'seeds', 'assets', 'images', 'channels', 'background')
  banner_dir = Rails.root.join('db', 'seeds', 'assets', 'images', 'channels', 'banner')

  puts "***CREATING CHANNELS***"

  puts "***CREATING RANDY OWEN***"
  Channel.create(
    :name => "Randy Owen", :subdomain => "randyowen", 
    :banner_image => File.new(File.join(banner_dir, 'randy-owen.jpg')), 
    :description => "The legendary Randy Owen of Alabama takes you behind the scenes both in concert and in real life. 
    Concerts, backstage access, custom games and trips money can't buy. Plus, some up close and personal access to Randy, 
    his family and his down home Ft Payne, Alabama life. All this plus scheduled live performances!"
  )

  puts "***CREATING Alive At Brushy***"
  Channel.create(
    :name => "Alive At Brushy", :subdomain => "aliveatbrushy", :background_color => "000000",
    :banner_image => File.new(File.join(banner_dir, 'mark-collie.jpg')), :background_image => File.new(File.join(background_dir, 'mark-collie.png')),
    :twitter_id => "aliveatbrushy", :facebook_page => "aliveatbrushy", 
    :description => "After 113 years, the state of Tennessee closed Brushy Mountain State Penitentiary in June of 2009.  
    But not before country music icon Mark Collie took a two year journey inside the walls of this legendary place.  
    While there, he learned the stories and spoke to most of the population housed there.  What emerged was music that many liken to the late Johnny Cash.  
    This is true Americana and the world now can access the music and an upcoming world premiere feature recorded live from the prison.  Experience it here.",
    :active => true
  )

  puts "***CREATING SAM PHILLIPS***"
  Channel.create(
    :name => "Sam Phillips", :subdomain => "samphillips", :background_color => "FFFFFF", 
    :banner_image => File.new(File.join(banner_dir, 'sam-phillips.png')), 
    :description => "Legendary music entrepreneur, and Sun records founder, Sam Phillips believed in music with no limits.  
    Tearing down racial barriers and launching careers for great artists such as BB King, Howlin Wolf, Elvis Presley, 
    Carl Perkins, Johnny Cash, Jerry Lee Lewis, Charlie Rich, Roy Orbison and many more. That's what you will find right here. 
    Rock-N-Roll Swag, behind the scenes footage, live performances and exclusive interviews revealing untold stories on the history of 
    Rock-N-Roll and it's continuing influence on modern music."
  )

  puts ""
end
