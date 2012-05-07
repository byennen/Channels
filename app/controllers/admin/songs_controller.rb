class Admin::SongsController < Admin::ApplicationController
  layout 'admin'
  before_filter :authenticate_user!, :load_channels
  load_and_authorize_resource

  helper_method :parent, :resource
  respond_to :html, :json

  def index
    @song = Song.includes(:channel_id)
  end

  def new
    build_resource
  end

  def edit
    @song = resource
  end

  def create
    build_resource
    if @song.save
      flash[:notice] = "Song was successfully created"
    end
    respond_with @song, :location => admin_channel_songs_url
  end

  def update
    @song = resource
    if @song.update_attributes(params[:song])
      flash[:notice] = "Song was successfully updated."
    end
    respond_with @song, :location => admin_channel_songs_ur
  end

  def destroy
    @song = resource
    @song.destroy
    redirect_to admin_songs_url
  end

  def parent_name
    "channel"
  end

  def resource_name
    "song"
  end

end
