class PhotosController < ApplicationController
  def index
    logger.debug("params")
    @photo_album = current_channel.photo_albums.find(params[:photo_album_id])
    @photos = @photo_album.photos
  end
  
  def show
  end
end
