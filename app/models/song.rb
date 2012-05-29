class Song < ActiveRecord::Base
  belongs_to :channel

  scope :available, where(:active => true)
  scope :intro, where(:intro => true)

  def self.next_song
    Song.available.find(:first, :order => "rand()")
  end

  def self.intro_song
  	Song.available.intro.find(:first, :order => "rand()")
  end

  def self.next_channel_song(channel)
    Song.available.find(:first, :conditions => {:channel_id => channel}, :order => "rand()")
  end
end
