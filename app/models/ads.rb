class Ads < ActiveRecord::Base
  attr_accessible :channel_id, :published
  belongs_to :uploadable, polymorphic: true

end
