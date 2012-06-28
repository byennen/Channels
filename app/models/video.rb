class Video < ActiveRecord::Base

  VIDEO_EXTENSIONS = ['mp4', 'ogg', 'webm']

  include Rails.application.routes.url_helpers

  belongs_to :channel

  attr_accessible :id, :channel_id, :title, :description, :image, :paid, :active, :channel, :video, :preview
  image_accessor :image

  mount_uploader :video, VideoUploader
  mount_uploader :preview, VideoUploader

  scope :published, where('active IS NOT NULL AND active = 1')
  scope :recent, published.order(:created_at).limit(8)

  def filename
    read_attribute :video
  end

  def sources
    sources = []
    file_extension = filename.split('.').last
    VIDEO_EXTENSIONS.each do |ext|
      sources << video.url.gsub(file_extension, ext)
    end
    sources
  end
  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:video),
      "size" => video.size,
      "url" => video.url,
      "delete_url" => admin_channel_video_path(channel.id, id),
      "delete_type" => "DELETE"
    }
  end

end
