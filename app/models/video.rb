class Video < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  
  belongs_to :channel
  
  attr_accessible :id, :channel_id, :title, :description, :image, :paid, :active, :channel, :video, :preview
  image_accessor :image
  
  mount_uploader :video, VideoUploader
  mount_uploader :preview, VideoUploader
  
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
