class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def load_channels
    @channels = Channel.all
  end

  def load_channel
    @channel = Channel.find_by_subdomain!(request.subdomain)
  end
end
