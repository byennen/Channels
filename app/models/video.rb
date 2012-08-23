class Video < ActiveRecord::Base

  VIDEO_EXTENSIONS = [
    {:ext => "mp4", :type => "video/mp4"},
    {:ext => "ogg", :type => "video/ogg"},
    {:ext => "webm", :type => "video/webm"}
  ]

  include Rails.application.routes.url_helpers

  belongs_to :channel
  
  # has_one :teaser
  # has_one :performance
  has_one :video_preview
  
  attr_accessible :id, :channel_id, :title, :description, :image, :paid, 
                  :publish_on, :channel, :video, :video_preview_attributes
                  
  image_accessor :image

  validate :image_present_for_publish

  accepts_nested_attributes_for :video_preview
  
  mount_uploader :video, VideoUploader

  scope :published, where('publish_on is not null and publish_on < ?', Time.zone.now)
  scope :recent, published.order('publish_on DESC').limit(4)
  
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  acts_as_list :scope => :channel 
  
  def filename
    read_attribute :video
  end
  
  def self.current_episode
    published.recent.first
  end
  
  def self.coming_soon(current_video)
    Video.where("publish_on > ?", current_video.publish_on).order('publish_on ASC').limit(4)
  end
  
  def sources
    sources = []
    file_extension = filename.split('.').last
    VIDEO_EXTENSIONS.each do |ext|
      sources << {:src => video.url.gsub(file_extension, ext[:ext]), :type => ext[:type] }
    end
    sources
  end

  def processed!
    update_attribute(:processed, true)
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
    
    def image_present_for_publish
      if !publish_on.blank? && image.nil?
        errors.add(:publish_on, "Image must be present before publishing")
      end
    end
end
