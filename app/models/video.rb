class Video < ActiveRecord::Base

  VIDEO_EXTENSIONS = [
    {:ext => "mp4", :type => "video/mp4"},
    {:ext => "ogg", :type => "video/ogg"},
    {:ext => "webm", :type => "video/webm"}
  ]

  include Rails.application.routes.url_helpers

  belongs_to :channel

  attr_accessible :id, :channel_id, :title, :description, :image, :paid, :active, :channel, :video, :preview
  image_accessor :image

  validate :image_present_for_active

  mount_uploader :video, VideoUploader
  mount_uploader :preview, VideoUploader

  scope :published, where('active IS NOT NULL AND active = true')
  scope :recent, published.order(:created_at).limit(8)

  def filename
    read_attribute :video
  end

  def sources
    sources = []
    file_extension = filename.split('.').last
    VIDEO_EXTENSIONS.each do |ext|
      sources << {:src => video.url.gsub(file_extension, ext[:ext]), :type => ext[:type] }
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

  private

    def image_present_for_active
      if self.active == true
        if self.image.nil?
          self.errors[:active] = "Image must be present before making active"
          return false if self.image.nil?
        end
      end
      return true
    end
end
