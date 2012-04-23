class Song < ActiveRecord::Base
  belongs_to :channel

  scope :available, where(:active => true)

  def self.next_song
    Song.available.find(:first, :order => "rand()")
  end

  def self.next_channel_song(channel)
    Song.find(:first, :conditions => {:channel_id => channel}, :order => "rand()")
  end
end
