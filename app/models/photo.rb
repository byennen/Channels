class Photo < ActiveRecord::Base
  
  belongs_to :photo_album

  attr_accessible :id, :channel_id, :title, :description, :paid, :active, :image, :channel
  image_accessor :image
end
