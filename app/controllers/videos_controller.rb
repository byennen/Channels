class VideosController < ApplicationController

  respond_to :html

  def index
    @channels = Channel.all
    @videos = Video.published
  end

  def show
    @featured_album = current_channel.albums.first
    @video = Video.find(params[:id])
    #if current_user && current_user.facebook?
      #Resque.enqueue(MemberWorker, :share_view, {"user_id" => current_user.id, "video_url" => video_url(@video)})
    #end
    @videos = recent_videos
    if @video.present?
      @next_video = Video.coming_soon(@video).first
    end    
  end
  
  private
  
  def recent_videos
    current_videos = @channel.videos.recent
    if current_videos.size < 8
      upcoming_videos = @channel.videos.coming_soon(@video)
      logger.debug("Upcoming videos are #{upcoming_videos.inspect}")
      upcoming_videos.each { |v| current_videos << v }
    end
    logger.debug("current videos are #{current_videos.inspect}")
    current_videos
  end
end
