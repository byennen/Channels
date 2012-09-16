class Song < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :album
  has_many :uploads, as: :uploadable
  acts_as_list

  attr_accessible :id, :album_id, :title, :price, :active, :album, :song, :preview

  before_create :set_price

  validate :ensure_preview_and_album_image

  [:preview, :song].each do |t|
    mount_uploader t, SongUploader
  end

  money :price

  scope :available, where('songs.active = true')
  scope :intro, where(:intro => true)

  scope :published, where('songs.active IS NOT NULL AND songs.active = true')
  scope :recent, published.order(:created_at).limit(8)

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def self.next_song
    Song.available.find(:first, :order => "rand()")
  end

  def filename
    read_attribute :song
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

  def waveform_temp_file
    Rails.root.join('tmp', filename)
  end

  def waveform_wav_file
    Rails.root.join('tmp', "#{filename}.wav")
  end

  def waveform_image
    Rails.root.join('tmp', "waveform_#{id}.png")
  end

  def fog_connection
    connection = Fog::Storage.new({
      :provider                 => 'AWS',
      :aws_secret_access_key    => APP_CONFIG["aws_secret_access_key"],
      :aws_access_key_id        => APP_CONFIG["aws_access_key"]
    })
  end

  def s3_directory
    fog_connection.directories.get(APP_CONFIG["aws_bucket"])
  end

  def create_temp_file(preview=false)
    local_file = File.open(waveform_temp_file, "wb")
    s3_file = "#{s3_path}/#{filename}"
    file = s3_directory.files.get(s3_file)
    local_file.write(file.body)
  end

  def s3_path(preview=false)
    path = preview == false ? "song/song/#{id}" : "song/preview/#{id}"
  end

  def waveform_url(preview=false)
    "http://s3.amazonaws.com/#{APP_CONFIG["aws_bucket"]}/#{s3_path(preview)}/waveform.png"
  end

  def convert_to_wave
    command = %Q{/usr/local/bin/ffmpeg -y -i "#{waveform_temp_file}" -f wav "#{waveform_wav_file}" > /dev/null 2>&1}
    system command
  end

  def copy_waveform_to_s3(preview=false)
    file = s3_directory.files.create(
             body:   File.open(waveform_image),
             key:    "#{s3_path(preview)}/waveform.png",
             public: true
    )
  end

  def clean_waveform_files
    FileUtils.rm(waveform_temp_file)
    FileUtils.rm(waveform_image)
    FileUtils.rm(waveform_wav_file)
  end

  def generate_waveform(preview=false)
    create_temp_file(preview)
    convert_to_wave
    Waveform.new(waveform_wav_file).generate(waveform_image)
    copy_waveform_to_s3(preview)
    clean_waveform_files
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
    {
     id: id,
     url: song.url,
     preview_url: preview.url,
     title: title,
     album_title: album.title,
     album_image: album.image.thumb('70x70').url,
     artist_name: album.channel.name,
     waveform:    waveform_url,
     preview_waveform: waveform_url(true)
     }
  end

  protected

    def set_price
      self.price = 1.00
    end

    def ensure_preview_and_album_image
      if self.active == true
        if album.image.nil? && self.preview.nil?
          self.errors[:active] = "Album must have an image and preview must be present"
          return false
        elsif self.album.image.nil?
          self.errors[:active] = "Album image must be present"
          return false
        elsif self.preview.nil?
          self.errors[:active] = "Preview must be present"
          return false
        end
      end
      return true
    end

end
