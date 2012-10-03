after :users, :channels, :albums do
  aliveatbrushy = Album.find_by_title('Alive at Brushy Mountain State Penitentiary')
  americanjobs = Album.find_by_title('American Jobs')


  full_song_dir = Rails.root.join('db', 'seeds', 'assets', 'albums')
  preview_song_dir = Rails.root.join('db', 'seeds', 'assets', 'albums')

  puts "***CREATING SONGS - Uploading Mark Collies - Brushy Mountain***"

  Song.create(:album => aliveatbrushy, :title => "One More Second Chance", :active => true, :price => "1.00",
              :song => File.new(File.join(full_song_dir, "brushy_mountain/full/01 One More Second Chance.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "brushy_mountain/preview/01 One More Second Chance.mp3"))
             )

  Song.create(:album => aliveatbrushy, :title => "I Could've Gone Right", :active => true, :price => "1.00", 
              :song => File.new(File.join(full_song_dir, "brushy_mountain/full/02 I Could've Gone Right.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "brushy_mountain/preview/02 I Could've Gone Right.mp3"))
             )

  Song.create(:album => aliveatbrushy, :title => "Maybe Mexico", :active => true, :price => "1.00", 
              :song => File.new(File.join(full_song_dir, "brushy_mountain/full/03 Maybe Mexico.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "brushy_mountain/preview/03 Maybe Mexico.mp3"))
             )

  Song.create(:album => aliveatbrushy, :title => "Heaven Bound", :active => true, :price => "1.00", 
              :song => File.new(File.join(full_song_dir, "brushy_mountain/full/04 Heaven Bound.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "brushy_mountain/preview/04 Heaven Bound.mp3"))
             )

  Song.create(:album => aliveatbrushy, :title => "Got A Feelin' For Ya", :active => true, :price => "1.00", 
              :song => File.new(File.join(full_song_dir, "brushy_mountain/full/05 Got A Feelin For Ya.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "brushy_mountain/preview/05 Got A Feelin For Ya.mp3"))
             )

  Song.create(:album => aliveatbrushy, :title => "On The Day I Die", :active => true, :price => "1.00", 
              :song => File.new(File.join(full_song_dir, "brushy_mountain/full/06 On The Day I Die.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "brushy_mountain/preview/06 On The Day I Die.mp3"))
             )

  Song.create(:album => aliveatbrushy, :title => "Dead Man Runs Before He Walks", :active => true, :price => "1.00", 
              :song => File.new(File.join(full_song_dir, "brushy_mountain/full/07 Dead Man Runs Before He Walks.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "brushy_mountain/preview/07 Dead Man Runs Before He Walks.mp3"))
             )

  Song.create(:album => aliveatbrushy, :title => "Rose Covered Garden", :active => true, :price => "1.00", 
              :song => File.new(File.join(full_song_dir, "brushy_mountain/full/08 Rose Covered Garden.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "brushy_mountain/preview/08 Rose Covered Garden.mp3"))
             )

  Song.create(:album => aliveatbrushy, :title => "Why Me Lord", :active => true, :price => "1.00", 
              :song => File.new(File.join(full_song_dir, "brushy_mountain/full/09 Why Me Lord.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "brushy_mountain/preview/09 Why Me Lord.mp3"))
             )

  Song.create(:album => aliveatbrushy, :title => "Do As I Say", :active => true, :price => "1.00", 
              :song => File.new(File.join(full_song_dir, "brushy_mountain/full/10 Do As I Say.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "brushy_mountain/preview/10 Do As I Say.mp3"))
             )

  Song.create(:album => aliveatbrushy, :title => "Someday My Luck Will Change", :active => true, :price => "1.00", 
              :song => File.new(File.join(full_song_dir, "brushy_mountain/full/11 Someday My Luck Will Change.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "brushy_mountain/preview/11 Someday My Luck Will Change.mp3"))
             )

  Song.create(:album => aliveatbrushy, :title => "Folsom Prison Blues", :active => true, :price => "1.00", 
              :song => File.new(File.join(full_song_dir, "brushy_mountain/full/12 Folsom Prison Blues.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "brushy_mountain/preview/12 Folsom Prison Blues.mp3"))
             )

  Song.create(:album => aliveatbrushy, :title => "Reckless Companions", :active => true, :price => "1.00", 
              :song => File.new(File.join(full_song_dir, "brushy_mountain/full/13 Reckless Companions.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "brushy_mountain/preview/13 Reckless Companions.mp3"))
             )

  Song.create(:album => aliveatbrushy, :title => "Gospel Train", :active => true, :price => "1.00", 
              :song => File.new(File.join(full_song_dir, "brushy_mountain/full/14 Gospel Train.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "brushy_mountain/preview/14 Gospel Train.mp3"))
             )


  puts "***CREATING SONGS - Uploading Randy Owens - American Jobs***"

  Song.create(:album => americanjobs, :title => "American Jobs", :active => true, :price => "1.88",
              :song => File.new(File.join(full_song_dir, "american_jobs/american_jobs.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "american_jobs/american_jobs.mp3"))
             )

  Song.create(:album => americanjobs, :title => "Chillin", :active => false, :price => "1.88", 
              :song => File.new(File.join(full_song_dir, "american_jobs/chillin.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "american_jobs/chillin.mp3"))
             )

  Song.create(:album => americanjobs, :title => "Yellow Camero", :active => false, :price => "1.88", 
              :song => File.new(File.join(full_song_dir, "american_jobs/yellow_camero.mp3")), 
              :preview => File.new(File.join(preview_song_dir, "american_jobs/yellow_camero.mp3"))
             )


  puts ""
end

