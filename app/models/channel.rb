class Channel < ActiveRecord::Base
  has_many :channel_masters, :class_name => 'User'
  has_one :feature
  has_many :albums, :dependent => :destroy
  has_many :songs, :through => :albums  
  has_many :photo_albums, :dependent => :destroy
  has_many :photos, :through => :photo_albums
  has_many :videos
  has_many :posts
  
  has_many :facebook_pages

  scope :available, where(:active => true)
  scope :intro, where(:intro => true)

  attr_accessible :id, :name, :subdomain, :description, :background_image, :banner_image, :background_color, :feature_attributes, :google_analytics_key, :facebook_page, :twitter_id, :google_plus_page, :active
  accepts_nested_attributes_for :feature

  image_accessor :background_image
  image_accessor :banner_image

  after_create :set_default_features

  def set_default_features
    Feature.create(:channel_id => self.id, :audio => false, :vault => false, :news => false, :events => false, :giving => false)
  end

  def next_song
    output = {}
    s = self.songs.available.find(:first, :order => "rand()")
    if s.present?
      output[:title] = s.title
      output[:album] = s.album.title
      output[:filename] = s.get_url
    end
    output
  end

end
