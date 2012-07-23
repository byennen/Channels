class Album < ActiveRecord::Base
  belongs_to :channel
  has_many :songs

  attr_accessible :id, :channel_id, :title, :description, :image, :channel, :active, :price
  image_accessor :image

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

end
