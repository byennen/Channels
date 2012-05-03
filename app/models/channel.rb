class Channel < ActiveRecord::Base
  has_many :channel_masters, :class_name => 'User'
  has_one :feature
  has_many :songs

  attr_accessible :id, :name, :subdomain, :description, :background_image, :banner_image
  image_accessor :background_image
  image_accessor :banner_image

  after_create :set_default_features

  def set_default_features
    Feature.create(:channel_id => self.id, :audio => false, :vault => false, :news => false, :events => false, :giving => false)
  end
end
