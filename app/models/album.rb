class Album < ActiveRecord::Base
  belongs_to :channel

  attr_accessible :id, :channel_id, :title, :description, :image, :channel
  image_accessor :image
end
