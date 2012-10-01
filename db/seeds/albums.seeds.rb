after :users, :channels do
  channel = Channel.find_by_subdomain('aliveatbrushy')

  album_dir = Rails.root.join('db', 'seeds', 'assets', 'images', 'albums')

  puts "***CREATING ALBUMS***"

  Album.create(
    :channel => channel, :title => "Alive at Brushy Mountain State Penitentiary", :description => "Demo", :price => "9.99", :active => true,
    :publish_at => 1.days.ago, :release_date => 0.days.ago,
    :image => File.new(File.join(album_dir, 'brushy_mountain/mark-collie.png'))
  )

  puts ""
end
