class Admin::VideosController < Admin::ApplicationController
  layout 'admin'
  before_filter :authenticate_user!, :load_channels
  load_and_authorize_resource :channel
  load_and_authorize_resource :video, :through => :channel

  respond_to :html

  def index
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(params[:video].merge(:channel => @channel))
    if @video.save
      flash[:notice] = "Video was successfully created."
    end
    respond_with @video, :location => admin_channel_videos_url
  end

  def update
    if @video.update_attributes(params[:video])
      flash[:notice] = "Video was successfully updated."
    end
    respond_with @video, :location => admin_channel_videos_url
  end

  def destroy
    @video.destroy
    redirect_to admin_channel_videos_url
  end

end
