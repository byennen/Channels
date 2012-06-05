class Admin::FeaturesController < Admin::ApplicationController
  load_and_authorize_resource :channel
  # load_and_authorize_resource :feature, :through => :channel

  respond_to :html

  def edit
    @feature = Feature.find(params[:id])
  end

  def update
    @feature = Feature.find(params[:id])
    if @feature.update_attributes(params[:feature])
      flash[:notice] = "Feature was successfully updated."
    end
    respond_with @feature, :location => admin_channel_path(@channel)
  end

end
