class VideoUploader < CarrierWave::Uploader::Base
  include Rails.application.routes.url_helpers
  
  after :store, :zencode
  
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(mov avi mp4 mkv wmv mpg)
  end

  # def filename
  #  "video.mp4" if original_filename
  # end
  
  def file_prefix
    original_filename.split('.').first
  end

  private 

  def zencode(args)
    Rails.logger.debug("fog directory is #{fog_directory}")
    zencoder_response = Zencoder::Job.create({:input => "s3://#{fog_directory}/#{store_dir}/#{original_filename}",
                                              :output => [{:base_url => "s3://#{fog_directory}/#{store_dir}",
                                                           :filename => "#{file_prefix}.mp4",
                                                           :label => "mp4",
                                                           :notifications => [zencoder_callback_url(:protocol => 'http', :host => 'www.altimarc-staging.com')],
                                                           :quality => 3,
                                                           :format => "mp4",
                                                           :public => 1},
                                                          {:base_url => "s3://#{fog_directory}/#{store_dir}",
                                                           :filename => "#{file_prefix}.ogg",
                                                           :label => "ogg",
                                                           :notifications => [zencoder_callback_url(:protocol => 'http', :host => 'www.altimarc-staging.com')],
                                                           :quality => 3,
                                                           :format => "ogg",
                                                           :public => 1},
                                                          {:base_url => "s3://#{fog_directory}/#{store_dir}",
                                                           :filename => "#{file_prefix}.ogg",
                                                           :label => "webm",
                                                           :notifications => [zencoder_callback_url(:protocol => 'http', :host => 'www.altimarc-staging.com')],
                                                           :quality => 3,
                                                           :format => "webm",
                                                           :public => 1}]
                                              })

    Rails.logger.debug("Zencoder response is #{zencoder_response.inspect}")
    zencoder_response.body["outputs"].each do |output|
      if output["label"] == "mp4"
        @model.zencoder_output_id = output["id"]
        @model.processed = false
        @model.save(:validate => false)
      end
    end
  end
end
