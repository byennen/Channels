class Admin::AlbumsController < Admin::ApplicationController
  load_and_authorize_resource :channel
  load_and_authorize_resource :album, :through => :channel
  
  respond_to :html, :json

  def index
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = Album.new(params[:album].merge(:channel => @channel))

    if @album.save
      flash[:notice] ='Album was successfully created.'
    end
    respond_with @album, :location => admin_channel_albums_url
  end

  def update
    if @album.update_attributes(params[:album])
      flash[:notice] = 'Album was successfully updated.'
    end
    respond_with @album, :location => admin_channel_albums_url
  end

  def destroy
    @album.destroy
    redirect_to admin_channel_albums_url
  end
end
