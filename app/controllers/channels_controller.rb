class ChannelsController < ApplicationController
  before_filter :load_channels, :load_channel

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @channel }
    end
  end

end
