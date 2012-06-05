class SongsController < ApplicationController

  def index
    @songs = Song.all
    render :json => @songs
  end

  def show
  end

  def next_song
    render :json => Song.next_song()
  end

  def intro
  	render :json => Song.intro_song()
  end
end
