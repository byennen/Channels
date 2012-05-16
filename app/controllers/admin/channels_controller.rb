class Admin::ChannelsController < Admin::ApplicationController
  before_filter :authorize_admin, :except => [:show]
  load_and_authorize_resource :channel
  load_and_authorize_resource :album


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
