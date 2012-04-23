class SongsController < ApplicationController

  def index
    @songs = Song.all
    render :json => @songs
  end

  def next_song
    @songs = Song.find(:first, :order => "rand()")
  end

end
