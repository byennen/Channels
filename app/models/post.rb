class Post < ActiveRecord::Base
  
  belongs_to :channel
  has_many :contents, as: :contentable
  
  attr_accessible :channel, :title, :description, :publish_date, :start_date, 
                  :end_date, :link, :logo
  
  def available_features
    features = []
    features << "News" if channel.feature.news?
    features << "Events" if channel.feature.events?
    features << "Giving" if channel.feature.giving?
    features << "Life" if channel.id == 1
  end
  
end
