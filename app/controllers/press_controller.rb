class PressController < ApplicationController
  before_filter :verifies_press_only_user, :only => [:show]
  
  def index
  end

  def show
    @channel = Channel.find(params[:id])
    @videos = @channel.videos.all(:limit => 4)
    @album = @channel.albums.first
    @songs = @album.songs.all(:order => "position")
    @photos = @channel.photos.all

    #@channel = Channel.find_by_subdomain('aliveatbrushy')
    #@videos = Video.all
    ##@featured_album = Album.find_by_title('Alive at Brushy Mountain State Penitentiary')
  end

  def verifies_press_only_user
    unless cookies[:press]
      authenticate_or_request_with_http_basic do |username, password|
        username == "press" && password == "press"
        cookies[:press] = {:value => "altimarc-press", :expires => 5.days.from_now.utc, :domain => :all}
      end
    end
  end
end
