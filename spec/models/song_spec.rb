require 'spec_helper'

describe Song do
  before(:all) do
    Song.delete_all
  end

  it "returns next song to play" do
    song_to_play = create(:album_song, :title => "promoted song", :active => true)
    song_not_to_play = create(:album_song, :title => "not promoted", :active => false)
    Song.next_song.should == song_to_play
  end


  xit "returns intro song" do
    intro_song = create(:song, :title => "intro song to play", :active => true, :intro => true)
    Song.intro_song().should == intro_song
  end

  xit "doesn't return inactive intro song" do
    intro_song = create(:song, :title => "intro song to play", :active => false, :intro => true)
    Song.intro_song().should == nil
  end
end
