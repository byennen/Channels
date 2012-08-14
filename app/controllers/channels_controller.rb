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
    @video = @channel.videos.find(9)

    #for testing in dev right now
    @video_playlist = "0: {src: 'https://altimarc-staging.s3.amazonaws.com/video/video/20/Brushy_Folsom_Episode_with_Hanger.mp4', type: 'video/mp4'},1: {src: 'https://altimarc-staging.s3.amazonaws.com/video/video/20/Brushy_Folsom_Episode_with_Hanger.ogg', type: 'video/ogg'},2: {src: 'https://altimarc-staging.s3.amazonaws.com/video/video/20/Brushy_Folsom_Episode_with_Hanger.webm', type: 'video/webm'}"
  end

  def next_song
    render :json => @channel.next_song()
  end
end
