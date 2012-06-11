class SongsController < ApplicationController

  def index
    @songs = Song.all
    render :json => @songs
  end

  def show
  end

  def next_song
    if @channels.present?
      render :json => {:title => "Channel song", :channels => @channels}
    else
      render :json => Song.next_song()
    end
  end

  def intro
    render :json => Song.intro_song()
  end
end
