class Admin::PhotosController < Admin::ApplicationController
  load_and_authorize_resource :channel
  load_and_authorize_resource :photo, :through => :channel

  respond_to :html, :json

  def index
  end

  def new
    @photo = Photo.new
  end

  def edit
  end

  def create
    @photo = Photo.new(params[:photo].merge(:channel => @channel))

    if @photo.save
      flash[:notice] ='Photo was successfully created.'
    end
    respond_with @photo, :location => admin_channel_photos_url
  end

  def update
    if @photo.update_attributes(params[:photo])
      flash[:notice] = 'Photo was successfully updated.'
    end
    respond_with @photo, :location => admin_channel_photos_url
  end

  def destroy
    @photo.destroy
    redirect_to admin_channel_photos_url
  end
end
