class Admin::PhotoAlbumsController < Admin::ApplicationController
  
  load_and_authorize_resource :channel
  load_and_authorize_resource :photo_album, :through => :channel
  
  respond_to :html, :json
    
  def index; end
  
  def show; end
  
  def new
    @photo_album = PhotoAlbum.new
  end
  
  def create
    @photo_album.attributes = params[:photo_album]
    if @photo_album.save
      flash[:notice] = "Photo Album created successfully"
    end
    respond_with @photo_album, :location => admin_channel_photo_albums_url
  end
  
  def edit; end
  
  def update; end
  
  def destroy; end
  
end
