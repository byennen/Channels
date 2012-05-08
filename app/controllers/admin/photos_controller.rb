class Admin::PhotosController < Admin::ApplicationController
  layout 'admin'
  before_filter :authenticate_user!, :load_channels
  load_and_authorize_resource

  helper_method :parent, :resource
  respond_to :html, :json

  def index
    @photos = Photo.all
  end

  def new
    build_resource
  end

  def edit
    @photo = resource
  end

  def create
    build_resource
    if @photo.save
      flash[:notice] ='Photo was successfully created.'
    end
    respond_with @photo, :location => admin_channel_photos_url
  end

  def update
    @photo = resource
    if @photo.update_attributes(params[:photo])
      flash[:notice] = 'Photo was successfully updated.'
    end
    respond_with @photo, :location => admin_channel_photos_url
  end

  def destroy
    @photo = resource
    @photo.destroy
    redirect_to admin_channel_photos_url
  end

  def parent_name
    "channel"
  end

  def resource_name
    "photo"
  end
end
