class PhotosController < ApplicationController
  
  before_filter :verify_paid_member
  
  def index
    @photo_album = current_channel.photo_albums.find(params[:photo_album_id])
    @photos = @photo_album.photos
  end
  
  def show
  end
  
  private
  
    def verify_paid_member
      unless current_user && current_user.paid_member?
        redirect_to '/'
      end
    end
    
end
