class ChannelsController < ApplicationController
  before_filter :load_channel, :only => [:show, :next_song]

  def index
    #if current_user && current_user.facebook?
      #Resque.enqueue(MemberWorker, :share_view, {"user_id" => current_user.id, "video_url" => video_url(@video)})
    #end
  end

  def show
    @featured_album = current_channel.albums.first
    @posts = @channel.posts.recent(:limit => 4)
    @songs = @channel.songs.all
    @video = @channel.videos.current_episode    
    @videos = recent_videos
    logger.debug("videos size is #{@videos.size}")
    @photo_albums = @channel.photo_albums.all
    if @video.present?
      @next_video = Video.coming_soon(@video).first
    end
    logger.debug("Next Video is #{@next_video.inspect}")
  end

  def next_song
    render :json => @channel.next_song()
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
