class Admin::LifesController < Admin::ApplicationController
  load_and_authorize_resource :channel
  #load_and_authorize_resource :life, :through => :channel

  respond_to :html
  
  def index
    #@life_content = @life.contentable
  end

  def edit
  end

  def new
    @life = life.contents.new
  end
  
  def create
    if @life.contents.save
      flash[:notice] = "life was successfully created."
    end
    respond_with @life, :location => admin_channel_lifes_url
  end

  def update
    if @life.contents.update_attributes(params[:life])
      flash[:notice] = "life was successfully updated."
    end
    respond_with @life, :location => admin_channel_lifes_url
  end

  def destroy
    @life.contents.destroy
    redirect_to admin_channel_lifes_url
  end
end
