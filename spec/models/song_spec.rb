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

  it "returns next song to play in channel" do
    song_to_play2 = FactoryGirl.create(:song, :title => "played song", :active => true, :channel_id => 2)
    song_to_play1 = FactoryGirl.create(:song, :title => "not played song", :active => true, :channel_id => 1)
    Song.next_channel_song(2).should == song_to_play2
    Song.next_channel_song(1).should == song_to_play1
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
