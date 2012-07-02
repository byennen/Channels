class Song < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :album
  has_many :uploads, as: :uploadable

  attr_accessible :id, :album_id, :title, :price, :active, :album, :song, :preview

  [:preview, :song].each do |t|
    mount_uploader t, SongUploader
  end

  before_create :set_price

  money :price

  scope :available, where(:active => true)
  scope :intro, where(:intro => true)

  scope :published, where('active IS NOT NULL AND active = true')
  scope :recent, published.order(:created_at).limit(8)

  def self.next_song
    Song.available.find(:first, :order => "rand()")
  end

  def get_url
    if self.uploads.first.present?
      filename = self.uploads.first.file_name
    else
      return {}
    end
    if filename.include? "http"
      return filename
    else
      return "/assets/#{filename}"
    end
  end

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    s = read_attribute(:song)
    logger.debug("song is #{s.inspect}")
    {
      "name" => read_attribute(:song),
      "size" => song.size,
      "url" => song.url,
      "delete_url" => admin_channel_album_song_path(album.channel.id, album.id, id),
      "delete_type" => "DELETE"
    }
  end

  def as_json(options={})
    logger.debug("Album is #{album.inspect}")
    logger.debug("channel is #{album.channel.inspect}")
    {
     url: song.url,
     preview_url: preview.url,
     title: title,
     album_title: album.title,
     album_image: album.image.thumb('70x70').url,
     artist_name: album.channel.name
     }
  end

  protected

    def set_price
      self.price = 1.00
    end


end
