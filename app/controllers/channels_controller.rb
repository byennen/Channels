class ChannelsController < ApplicationController
  before_filter :load_channel, :only => [:show, :next_song]

  def index
    #if current_user && current_user.facebook?
      #Resque.enqueue(MemberWorker, :share_view, {"user_id" => current_user.id, "video_url" => video_url(@video)})
    #end
  end

  def show
    @posts = @channel.posts.recent(:limit => 4)
    @songs = @channel.songs.all
    @videos = @channel.videos.recent
    @photo_albums = @channel.photo_albums.all
    @video = @channel.videos.current_episode
    if @video.present?
      @next_video = Video.where("publish_on > ?", @video.publish_on).order('publish_on DESC').first
    end
    logger.debug("Next Video is #{@next_video.inspect}")
  end

  def next_song
    render :json => @channel.next_song()
  end
end
