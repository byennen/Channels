class ChannelsController < ApplicationController
  before_filter :load_channel, :only => [:show, :next_song]

  def index
  end

  def show
    @posts = @channel.posts.recent
    @songs = @channel.songs.all
    @videos = @channel.videos.recent
    @photos = @channel.photos.recent
    @video = @channel.videos.last
  end

  def next_song
    render :json => @channel.next_song()
  end
end
