class Admin::PhotosController < Admin::ApplicationController
  load_and_authorize_resource :channel
  load_and_authorize_resource :photo_album
  load_and_authorize_resource :photo, :through => :photo_album, :new => :index

  respond_to :html, :json

  def index
    @photos = @photo_album.photos
  end

  def edit
  end

  def create
    @photo = Photo.new(params[:photo].merge(:photo_album => @photo_album))
    @photo.title = params[:photo][:image].original_filename
    if @photo.save
      respond_to do |format|
        format.html {
          render :json => [@photo.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@photo.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def update
    if @photo.update_attributes(params[:photo])
      flash[:notice] = 'Photo was successfully updated.'
    end
    respond_with @photo, :location => admin_channel_photos_url
  end

  def destroy
    @photo.destroy
    redirect_to admin_channel_photo_album_photos_url(@channel, @photo_album)
  end
end
