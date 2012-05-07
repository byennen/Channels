class Admin::FeaturesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!, :load_channels

  def edit
    @feature = Feature.find(params[:id])
    @channel = Channel.find(params[:id])
  end

  def update
    @feature = Feature.find(params[:id])

    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        format.html { redirect_to admin_channel_url, notice: 'Feature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feature = Feature.find(params[:id])
    @feature.destroy

    respond_to do |format|
      format.html { redirect_to admin_channel_url }
      format.json { head :no_content }
    end
  end

end
