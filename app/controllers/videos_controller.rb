class VideosController < ApplicationController
  # load_and_authorize_resource :channel
  # load_and_authorize_resource :video, :through => :channel

  respond_to :html

  def index
    @channels = Channel.all
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end
end
