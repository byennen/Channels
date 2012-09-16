class AlbumsController < ApplicationController
  
  def show
    @album = Album.find(params[:id], include: :songs)
    @featured_video = Video.recent.first
  end
  
end
