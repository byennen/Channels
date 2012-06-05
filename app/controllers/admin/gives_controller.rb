class Admin::GivesController < Admin::ApplicationController
  load_and_authorize_resource :channel
  #load_and_authorize_resource :give, :through => :channel

  respond_to :html

  def index
    #@give_content = @give.contentable
  end

  def edit
  end

  def new
    @give = give.contents.new
  end

  def create
    if @give.contents.save
      flash[:notice] = "give was successfully created."
    end
    respond_with @give, :location => admin_channel_gives_url
  end

  def update
    if @give.contents.update_attributes(params[:give])
      flash[:notice] = "give was successfully updated."
    end
    respond_with @give, :location => admin_channel_gives_url
  end

  def destroy
    @give.contents.destroy
    redirect_to admin_channel_gives_url
  end
end
