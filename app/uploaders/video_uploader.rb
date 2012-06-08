# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base

  storage (Rails.env.development? ? :file : :fog)

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
