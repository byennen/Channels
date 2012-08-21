class Performance < ActiveRecord::Base
  attr_accessible :processed, :video, :video_id, :zencoder_output_id
  
  belongs_to :video
  
  mount_uploader :video, VideoUploader
end
