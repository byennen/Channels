after :users, :channels, :photo_albums do
  channel = Channel.find_by_subdomain('markcollie')
  album = PhotoAlbum.find_by_title('Brushy Mountain')

  album_dir = Rails.root.join('db', 'seeds', 'assets', 'images', 'photos', 'brushy_mountain')

  puts "***CREATING PHOTOS***"
  
  #File.join(album_dir + "*").each do |file| 
    #file_name = File.basename(file)
    #puts file_name
  #end
  #

  Photo.create(
    :channel_id => channel, :photo_album => album, :title => "Brushy Mountain", :description => "Demo", :active => true,
    :image => File.new(File.join(album_dir, 'Tommy Burroughs, Mark Collie and Shawn Camp_web.jpg'))
  )

  puts ""
end
