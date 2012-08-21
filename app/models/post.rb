class Post < ActiveRecord::Base

  belongs_to :channel
  has_many :contents, as: :contentable
  belongs_to :photo
  belongs_to :video

  attr_accessible :channel, :feature, :title, :description, :publish_on,
                  :date, :start_time, :end_time, :link, :logo, :video_id,
                  :photo_id

  validates :title, :description, :feature, presence: true
  validate :photo_or_video_present

  image_accessor :logo

  scope :published, lambda { where('publish_on IS NOT NULL AND publish_on <= ?', Time.zone.now) }
  scope :by_publish_on, order(:publish_on)
  scope :recent, published.by_publish_on.limit(4)

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]


  def available_features
    features = []
    features << "News" if channel.feature.news?
    features << "Event" if channel.feature.events?
    features << "Giving" if channel.feature.giving?
    features << "Life" if channel.id == 1
    features << "Vault" if channel.feature.vault?
    return features
  end

  def image
    unless photo_id.blank?
      photo.image
    else
      video.image
    end
  end

  private

    def photo_or_video_present
      return true unless self.photo_id.nil? && self.video_id.nil?
      self.errors[:photo_id] << "Must pick a video or photo"
      self.errors[:video_id] << "Must pick a video or photo"
      return false
    end

end
