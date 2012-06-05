class Video < ActiveRecord::Base
  belongs_to :channel
  has_many :uploads, as: :uploadable
  
  attr_accessible :id, :channel_id, :title, :description, :image, :paid, :active, :channel
  image_accessor :image
end
