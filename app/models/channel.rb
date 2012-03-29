class Channel < ActiveRecord::Base
  has_one :feature
  has_many :songs

  attr_accessible :id, :name

  after_create :set_default_features

  def set_default_features
    Feature.create(:channel_id => self.id, :audio => false, :vault => false, :news => false, :events => false, :giving => false)
  end
end
