after :users, :channels do
  aliveatbrushy = Channel.find_by_subdomain('aliveatbrushy')
  randyowen = Channel.find_by_subdomain('randyowen')

  album_dir = Rails.root.join('db', 'seeds', 'assets', 'images', 'albums')

  puts "***CREATING ALBUMS***"

  Album.create(
    :channel => aliveatbrushy, :title => "Alive at Brushy Mountain State Penitentiary", :description => "Alive at Brushy Mountain State Penitentiary", 
    :price => "1000", :active => true, :preorder => false, :preorder_price => nil,
    :publish_at => 1.days.ago, :release_date => 0.days.ago,
    :image => File.new(File.join(album_dir, 'brushy_mountain/mark_collie.png'))
  )

  Album.create(
    :channel => randyowen, :title => "American Jobs", :description => "American Jobs Album", 
    :price => "14.98", :active => true, :preorder => true, :preorder_price => "10.00",
    :publish_at => "2012-10-01", :release_date => "2013-01-01",
    :image => File.new(File.join(album_dir, 'american_jobs/randy_owen.png'))
  )

  puts ""
end
