class Post < ActiveRecord::Base
  
  belongs_to :channel
  has_many :contents, as: :contentable
  belongs_to :photo
  belongs_to :video
  
  attr_accessible :channel, :feature, :title, :description, :publish_date, 
                  :date, :start_time, :end_time, :link, :logo, :video_id, 
                  :photo_id
                    
  validates :title, :description, :feature, presence: true
  validate :photo_or_video_present
  
  image_accessor :logo
  
    
  def available_features
    features = []
    features << "News" if channel.feature.news?
    features << "Event" if channel.feature.events?
    features << "Giving" if channel.feature.giving?
    features << "Life" if channel.id == 1
    features << "Vault" if channel.feature.vault?
    return features
  end
  
  private
  
    def photo_or_video_present
      return true unless self.photo_id.nil? && self.video_id.nil?
      self.errors[:base] << "Must pick a video or photo"
      return false
    end

end
