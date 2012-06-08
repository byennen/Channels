class Song < ActiveRecord::Base
  belongs_to :album
  has_many :uploads, as: :uploadable

  attr_accessible :id, :album_id, :title, :price, :active, :album, :song, :preview

  [:preview, :song].each do |t|
    mount_uploader t, SongUploader
  end
  
  money :price
  
  scope :available, where(:active => true)
  scope :intro, where(:intro => true)

  def self.next_song
    Song.available.find(:first, :order => "rand()")
  end

end
