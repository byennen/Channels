class PhotoAlbum < ActiveRecord::Base
  
  belongs_to :channel
  has_many :photos
  
  attr_accessible :title, :body
  
  
end
