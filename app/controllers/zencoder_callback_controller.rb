class ZencoderCallbackController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def create
    logger.debug("zencoder response is #{params}")
    output_id = params[:output][:id]
    job_state = params[:output][:state]
    video = Video.find_by_zencoder_output_id(output_id.to_s)
    if job_state == "finished" && video
      video.processed!
    end
    render :nothing => true
  end

  def teaser
    output_id = params[:output][:id]
    job_state = params[:output][:state]
    teaser = Teaser.find_by_zencoder_output_id(output_id.to_s)
    if job_state == "finished" && teaser
      teaser.processed!
    end
    render :nothing => true
  end
  
  def performance
  end
  
  def preview
    output_id = params[:output][:id]
    job_state = params[:output][:state]
    preview = VideoPreview.find_by_zencoder_output_id(output_id.to_s)
    if job_state == 'finished' && preview
      preview.processed!
    end
    render :nothing => true
  end
  
end
