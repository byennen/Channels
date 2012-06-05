class Admin::EventsController < Admin::ApplicationController
  load_and_authorize_resource :channel
  #load_and_authorize_resource :event, :through => :channel

  respond_to :html
  
  def index
    #@event_content = @event.contentable
  end

  def edit
  end

  def new
    @event = event.contents.new
  end
  
  def create
    if @event.contents.save
      flash[:notice] = "event was successfully created."
    end
    respond_with @event, :location => admin_channel_events_url
  end

  def update
    if @event.contents.update_attributes(params[:event])
      flash[:notice] = "event was successfully updated."
    end
    respond_with @event, :location => admin_channel_events_url
  end

  def destroy
    @event.contents.destroy
    redirect_to admin_channel_events_url
  end
end
