after :users, :channels do
  channel = Channel.find_by_subdomain('markcollie')

  puts "***CREATING ALBUMS***"
  album_dir = Rails.root.join('db', 'seeds', 'assets', 'images', 'albums')
  album = Album.create(:channel => channel, :title => "Brushy Mountain", :description => "Demo", :price => "9.99", :active => true, :image => File.new(File.join(album_dir, 'brushy-mountain/mark-collie.png')) )
  puts ""
end
