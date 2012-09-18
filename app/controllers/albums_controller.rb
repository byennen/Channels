class AlbumsController < ApplicationController
  
  def show
    @album = Album.find(params[:id])
    @songs = @album.songs.all(:order => "position")
    @featured_video = Video.recent.first
  end
  
end
