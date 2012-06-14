class Admin::VideosController < Admin::ApplicationController
  # load_and_authorize_resource :channel
  # load_and_authorize_resource :video, :through => :channel

  respond_to :html

  def index
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video.attributes = params[:video]
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
    if @video.update_attributes(params[:video])
      flash[:notice] = "Video was successfully updated."
    end
    respond_with @video, :location => admin_channel_videos_url
  end

  def destroy
    @video.destroy
    redirect_to admin_channel_videos_url
  end

end
