class Song < ActiveRecord::Base
  belongs_to :album
  has_many :uploads, as: :uploadable

  attr_accessible :id, :album_id, :title, :price, :active, :album

  scope :available, where(:active => true)
  scope :intro, where(:intro => true)

  def self.next_song
    Song.available.find(:first, :order => "rand()")
  end

  def self.intro_song
  	Song.available.intro.find(:first, :order => "rand()")
  end

end
