class Admin::ChannelsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!, :load_channels
  load_and_authorize_resource

  respond_to :html

  def index
    @channels = Channel.all
  end

  def new
    @channel = Channel.new
  end

  def edit
    @channel = Channel.find(params[:id])
  end

  def create
    @channel = Channel.new(params[:channel])
    if @channel.save
      flash[:notice] = "Channel was successfully created."
    end
    respond_with @channel, :location => admin_channels_path
  end

  def update
    @channel = Channel.find(params[:id])
    if @channel.update_attributes(params[:channel])
      flash[:notice] = "Channel was successfully updated"
    end
    respond_with @channel, :location => admin_channels_path
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
    redirect_to admin_channels_url
  end

end
