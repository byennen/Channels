class Teaser < ActiveRecord::Base
  attr_accessible :processed, :video_id, :video, :zencoder_output_id
  
  belongs_to :video
  
  mount_uploader :video, VideoUploader
  
end
