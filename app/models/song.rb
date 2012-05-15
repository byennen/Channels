class Song < ActiveRecord::Base
  belongs_to :album

  attr_accessible :id, :album_id, :title, :price, :filename, :file_preview, :active, :album

  scope :available, where(:active => true)

  def self.next_song
    Song.available.find(:first, :order => "rand()")
  end

  def self.next_channel_song(channel)
    Song.available.find(:first, :conditions => {:channel_id => channel}, :order => "rand()")
  end
end
