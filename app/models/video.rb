class Video < ActiveRecord::Base
  belongs_to :channel
  
  attr_accessible :id, :channel_id, :title, :description, :image, :paid, :active, :channel, :video, :preview
  image_accessor :image
  
  mount_uploader :video, VideoUploader
  mount_uploader :preview, VideoUploader
  
end
