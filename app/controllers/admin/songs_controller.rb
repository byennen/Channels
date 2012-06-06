class Admin::SongsController < Admin::ApplicationController
  load_and_authorize_resource :channel
  load_and_authorize_resource :album
  load_and_authorize_resource :song, :through => :album
  load_and_authorize_resource :upload, :through => :song
  
  respond_to :html, :json

  def index
  end

  def new
  end

  def edit
  end

  def create
    if @song.save
      flash[:notice] = "Song was successfully created"
    end
    respond_with @song, :location => admin_channel_album_songs_url
  end

  def update
    if @song.update_attributes(params[:song])
      flash[:notice] = "Song was successfully updated."
    end
    respond_with @song, :location => admin_channel_album_songs_url
  end

  def destroy
    @song.destroy
    redirect_to admin_channel_album_songs_url
  end
  
  def create_song_upload
    logger.debug("Creating upload")
    @song = @album.songs.create(title: "test", price: 3.50)
    #@upload = Upload.new(params[:upload] || params.delete_if{ |p| !Upload.attribute_names.include?(p) })
    @song_upload = @song.uploads.new(file_name: params[:file_name],
                                     file_type: params[:file_type],
                                     file_size: params[:file_size])
    render nothing: true if @song_upload.save
    # flash[:notice] = "Song was successfully updated."
    # render root_url
  end
  
end
