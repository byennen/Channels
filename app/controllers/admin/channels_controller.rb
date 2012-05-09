class Admin::ChannelsController < Admin::ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :load_channels
  load_and_authorize_resource :channel

  respond_to :html

  def index
  end

  def new
    @channel = Channel.new
  end

  def show
  end

  def edit
  end

  def create
    if @channel.save
      flash[:notice] = "Channel was successfully created."
    end
    respond_with @channel, :location => admin_channels_path
  end

  def update
    if @channel.update_attributes(params[:channel])
      flash[:notice] = "Channel was successfully updated"
    end
    respond_with @channel, :location => admin_channels_path
  end

  def destroy
    @channel.destroy
    redirect_to admin_channels_url
  end

end
