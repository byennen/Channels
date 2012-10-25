class HomeController < ApplicationController
  caches_page :index

  def index
    @featured_channel = Channel.find_by_subdomain('fatherofrocknroll')
    @featured_song = Song.recent.first
    @featured_video = Video.recent.first
    @featured_album = Album.find_by_title('Alive at Brushy Mountain State Penitentiary')
    @aliveatbrushy = Channel.find_by_subdomain('aliveatbrushy')
    @randyowen = Channel.find_by_subdomain('randyowen')
  end
end
