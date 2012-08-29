class Photo < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :photo_album

  before_create :set_title
  attr_accessible :id, :photo_album, :title, :description, :paid, :active, :image, :channel_id
  image_accessor :image

  scope :published, where('photos.active IS NOT NULL AND photos.active = true')
  scope :recent, published.order(:created_at).limit(8)

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
  
  def set_title
    title = self.title.split('.')
    self.title = title[0].humanize
  end
  
end
