class ChannelsController < ApplicationController
  before_filter :load_channel, :only => [:show, :next_song]
  
  def index
  end

  def show
  end

  def next_song
    render :json => @channel.next_song()
  end
end
