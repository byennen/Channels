class Song < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  
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
  
  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:song),
      "size" => song.size,
      "url" => song.url,
      "delete_url" => admin_channel_album_song_path(album.channel.id, album.id, id),
      "delete_type" => "DELETE" 
    }
  end

end
