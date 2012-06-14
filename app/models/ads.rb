class Ads < ActiveRecord::Base
  attr_accessible :channel_id, :published, :ad_file
  has_many :uploads, as: :uploadable
  #belongs_to :uploadable, polymorphic: true
  mount_uploader :ad_file, SongUploader

end
