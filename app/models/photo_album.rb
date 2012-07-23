class PhotoAlbum < ActiveRecord::Base

  belongs_to :channel
  has_many :photos

  attr_accessible :title, :description, :image, :channel

  image_accessor :image

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

end
