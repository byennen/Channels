class Song < ActiveRecord::Base
  belongs_to :album
  has_many :uploads, as: :uploadable

  attr_accessible :id, :album_id, :title, :price, :active, :album

  scope :available, where(:active => true)

  def self.next_song
    Song.available.find(:first, :order => "rand()")
  end

  def self.next_channel_song(channel)
    Song.available.find(:first, :conditions => {:channel_id => channel}, :order => "rand()")
  end
end
