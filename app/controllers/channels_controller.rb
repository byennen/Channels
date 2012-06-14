class ChannelsController < ApplicationController
  before_filter :get_channel, :only => [:show, :next_song]
  
  def index
  end

  def show
  end

  def next_song
    render :json => @channel.next_song()
  end

private
  
  def get_channel
    if request.subdomain.present?
      @channel = Channel.find_by_subdomain!(request.subdomain) 
    end
  end

end
