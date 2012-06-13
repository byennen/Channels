class ChannelsController < ApplicationController
  
  def index
  end

  def show
    if request.subdomain.present?
      @channel = Channel.find_by_subdomain!(request.subdomain) 
    end
  end

  def next_song
    render :json => @channel.next_song()
  end

end
