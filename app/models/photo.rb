class Photo < ActiveRecord::Base
  belongs_to :channel

  attr_accessible :id, :channel_id, :title, :description, :paid, :active, :image_uid
  image_accessor :image
end
