class Admin::VideosController < Admin::ApplicationController
  load_and_authorize_resource :channel
  load_and_authorize_resource :video, :through => :channel

  respond_to :html

  def index
  end

  def edit
  end

  def create
    @video.attributes = params[:video]
    @video.title = params[:video][:video].original_filename
    if @video.save
      respond_to do |format|
        format.html {  
          render :json => [@video.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => [@video.to_jq_upload].to_json			
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def update
    logger.debug("params are #{params[:video][:publish_on]}")
    @video.attributes = params[:video]
    @video.publish_on = DateTime.strptime(params[:video][:publish_on], '%m/%d/%Y').to_time
    logger.debug("video is #{@video.publish_on}")
    if @video.save
      logger.debug("videl valid is #{@video.valid?}")
      flash[:notice] = "Video was successfully updated."
      respond_with @video, :location => admin_channel_videos_url      
    else
      render :action => "edit"
    end
  end

  def destroy
    @video.destroy
    redirect_to admin_channel_videos_url
  end

end
