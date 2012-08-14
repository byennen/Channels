class Teaser < ActiveRecord::Base
  attr_accessible :processed, :video_id, :video, :zencoder_output_id
  
  belongs_to :video
  
  mount_uploader :video, VideoUploader

  def processed!
    update_attribute(:processed, true)
  end
    
  def filename
    read_attribute :video
  end
  
  def sources
    sources = []
    file_extension = filename.split('.').last
    Video::VIDEO_EXTENSIONS.each do |ext|
      sources << {:src => video.url.gsub(file_extension, ext[:ext]), :type => ext[:type] }
    end
    sources
  end
end
