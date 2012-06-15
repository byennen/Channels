class Photo < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  
  belongs_to :photo_album

  attr_accessible :id, :photo_album, :title, :description, :paid, :active, :image, :channel
  image_accessor :image
  
  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:image_name),
      "size" => image.size,
      "url" => image.url,
      "delete_url" => admin_channel_photo_album_photo_path(photo_album.channel.id, photo_album.id, id),
      "delete_type" => "DELETE" 
    }
  end
end
