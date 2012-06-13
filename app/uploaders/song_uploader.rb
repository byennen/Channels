# encoding: utf-8

class SongUploader < CarrierWave::Uploader::Base

  after :store, :log_file_name
  
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def log_file_name(file)
    Rails.logger.debug("file is #{file.inspect}")
  end

end
