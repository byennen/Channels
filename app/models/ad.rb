class Ad < ActiveRecord::Base
  attr_accessible :channel_id, :published
  has_many :uploads, as: :uploadable
  scope :available, where(:published => true)

  def self.next_ad
    output = {}
    s = self.available.find(:first, :order => "rand()")
    if s.present?
      output[:title] = "This is an ad"
      output[:album] = "Ads"
      output[:filename] = s.get_url
    end
    output
  end

  def get_url
    filename = self.uploads.first.file_name
    if filename.include? "http"
      return filename
    else
      return "/assets/#{filename}"
    end
  end
end
