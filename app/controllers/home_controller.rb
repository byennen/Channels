class HomeController < ApplicationController
  def index
    @featured_channel = Channel.find_by_subdomain('fatherofrocknroll')
    @featured_song = Song.recent.first
    @featured_video = Video.recent.first
    @featured_album = Album.find_by_title('Alive at Brushy Mountain State Penitentiary')
    @aliveatbrushy = Channel.find_by_subdomain('aliveatbrushy')
    @randyowen = Album.find_by_title('American Jobs')
    @samphillips = Channel.find_by_subdomain('fatherofrocknroll')
  end
end
