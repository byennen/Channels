require 'spec_helper'

describe Channel do
  
  describe 'domain lookup' do
    
    context 'with domain' do
      let!(:channel) { FactoryGirl.create(:channel, :domain => 'aliveatbrushy.com') }
      it { Channel.find_by_domain_or_subdomain('aliveatbrushy.com', []).should == @channel }
    end
    
    context 'with subdomain' do 
      let!(:channel) { FactoryGirl.create(:channel) }
      it { Channel.find_by_domain_or_subdomain('altimarc-test.com', ['test']).should == @channel }
    end
    
    context 'with invalid subdomain' do
      
    
  end

  it "returns next song to play in channel" do
    album = create(:album, :title => "my album")
    another_album = create(:album, :title => "my another album")
    song_to_play1 = create(:song, :title => "not played song", :active => true, :album => album )
    song_to_play2 = create(:song, :title => "played song", :active => true, :album => another_album)
    album.channel.next_song.should == song_to_play1
    another_album.channel.next_song.should == song_to_play2
  end
end
