class ChannelsController < ApplicationController
  before_filter :load_channel

  def show
  end

  def next_song
    render :json => @channel.next_song()
  end

end
