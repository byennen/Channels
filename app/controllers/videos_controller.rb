class VideosController < ApplicationController
  # load_and_authorize_resource :channel
  # load_and_authorize_resource :video, :through => :channel

  respond_to :html

  def index
    @channels = Channel.all
    @videos = Video.published
  end

  def show
    @video = Video.find(params[:id])
    if current_user && current_user.facebook?
      Resque.enqueue(MemberWorker, :share_view, {"user_id" => current_user.id, "video_url" => video_url(@video)})
    end
  end
end
