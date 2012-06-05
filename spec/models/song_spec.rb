require 'spec_helper'

describe Song do
  before(:all) do
    Song.delete_all
  end

  it "returns next song to play" do
    song_to_play = FactoryGirl.create(:song, :title => "promoted song", :active => true)
    song_not_to_play = FactoryGirl.create(:song, :title => "not promoted", :active => false)
    Song.next_song.should == song_to_play
  end


  it "returns intro song" do
    intro_song = FactoryGirl.create(:song, :title => "intro song to play", :active => true, :intro => true)
    Song.intro_song().should == intro_song
  end

  it "doesn't return inactive intro song" do
    intro_song = FactoryGirl.create(:song, :title => "intro song to play", :active => false, :intro => true)
    Song.intro_song().should == nil
  end
end
