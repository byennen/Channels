class SongsController < ApplicationController

  def index
    @songs = Song.all
    render :json => @songs
  end

  def show
    @song = Song.find(params[:id], :include => {:album => :channel})
    if @song.present?
      render :json => @song, :include => {:album => {:include => :channel }}
    end
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
