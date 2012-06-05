require 'spec_helper'

describe Channel do
  it "returns next song to play in channel" do
    album = FactoryGirl.create(:album, :title => "my album")
    another_album = FactoryGirl.create(:album, :title => "my another album")
    song_to_play1 = FactoryGirl.create(:song, :title => "not played song", :active => true, :album => album )
    song_to_play2 = FactoryGirl.create(:song, :title => "played song", :active => true, :album => another_album)
    album.channel.next_song.should == song_to_play1
    another_album.channel.next_song.should == song_to_play2
  end
end
