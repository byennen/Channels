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
  end
  
  def performance
  end
  
end
