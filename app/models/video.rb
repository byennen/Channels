class Video < ActiveRecord::Base
  belongs_to :channel
  
  attr_accessible :id, :channel_id, :title, :description, :short_video, :full_video, :image, :paid, :active, :channel
  image_accessor :short_video
  image_accessor :full_video
  image_accessor :image
end
