after :users, :channels do
  channel = Channel.find_by_subdomain('aliveatbrushy')

  album_dir = Rails.root.join('db', 'seeds', 'assets', 'images', 'albums')

  puts "***CREATING PHOTO ALBUMS***"

  PhotoAlbum.create(
    :channel => channel, :title => "Alive at Brushy Mountain State Penitentiary", :description => "Demo",
    :image => File.new(File.join(album_dir, 'brushy_mountain/mark-collie.png'))
  )

  puts ""
end
