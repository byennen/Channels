class AlbumsController < ApplicationController
  
  def show
    @album = Album.find(params[:id], include: :songs)
  end
  
end
