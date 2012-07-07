after :users, :channels, :albums do
  album = Album.find_by_title('Brushy Mountain')

  puts "***CREATING SONGS***"
  Song.create(:album => album, :title => "Breaking Bad", :active => true, :price => "1.00", :song => "song.mp3")
  Song.create(:album => album, :title => "D.V.N.O.", :active => true, :price => "1.00", :song => "dvno.mp3")
  Song.create(:album => album, :title => "Genesis", :active => true, :price => "1.00", :song => "genesis.mp3")
  Song.create(:album => album, :title => "Threee Paaarrrtyyy", :active => true, :price => "1.00", :song => "party.mp3")
  puts ""
end
