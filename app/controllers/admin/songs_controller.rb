class Admin::SongsController < Admin::ApplicationController
  load_and_authorize_resource :channel
  load_and_authorize_resource :album
  load_and_authorize_resource :song, :through => :album
  
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

end
