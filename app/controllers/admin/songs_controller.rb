class Admin::SongsController < Admin::ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  helper_method :parent, :resource

  def index
    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  def new
    build_resource

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song }
    end
  end

  def edit
    @song = resource
  end

  def create
    build_resource

    respond_to do |format|
      if @song.save
        format.html { redirect_to admin_channel_songs_url, notice: 'Song was successfully created.' }
        format.json { render json: admin_channel_songs_url, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @song = resource

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to admin_channel_songs_url, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song = resource
    @song.destroy

    respond_to do |format|
      format.html { redirect_to admin_channel_songs_url }
      format.json { head :no_content }
    end
  end

  def parent_name
    "channel"
  end

  def resource_name
    "song"
  end

end
