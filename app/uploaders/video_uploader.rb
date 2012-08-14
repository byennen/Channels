class VideoUploader < CarrierWave::Uploader::Base
  include Rails.application.routes.url_helpers

  after :store, :zencode

  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(mov avi mp4 mkv wmv mpg)
  end

  def file_prefix
    original_filename.split('.').first
  end

  def host
    Rails.env.production? ? 'www.altimarc.com' : 'www.altimarc-staging.com'
  end

  private

  def zencode(args)
    zencoder_response = Zencoder::Job.create({:input => "s3://#{fog_directory}/#{store_dir}/#{original_filename}",
                                              :output => [{:base_url => "s3://#{fog_directory}/#{store_dir}",
                                                           :filename => "#{file_prefix}.mp4",
                                                           :label => "mp4",
                                                           :notifications => [notification_url],
                                                           :quality => 3,
                                                           :format => "mp4",
                                                           :public => true},
                                                          {:base_url => "s3://#{fog_directory}/#{store_dir}",
                                                           :filename => "#{file_prefix}.ogg",
                                                           :label => "ogg",
                                                           :notifications => [notification_url],
                                                           :quality => 3,
                                                           :format => "ogg",
                                                           :public => true},
                                                          {:base_url => "s3://#{fog_directory}/#{store_dir}",
                                                           :filename => "#{file_prefix}.webm",
                                                           :label => "webm",
                                                           :notifications => [notification_url],
                                                           :quality => 3,
                                                           :format => "webm",
                                                           :public => true}]
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

  def notification_url
    case model.class.to_s
    when "Video"
      Rails.env.development? ? "http://zencoderfetcher/" : zencoder_callback_url(:protocol => 'http', :host => host, :user => 'admin@altimarc.com', :password => 'please')
    when "VideoPreview"
      Rails.env.development? ? "http://zencoderfetcher/" : preview_zencoder_callback_url(:protocol => 'http', :host => host, :user => 'admin@altimarc.com', :password => 'please')      
    when "Teaser"
      Rails.env.development? ? "http://zencoderfetcher/" : teaser_zencoder_callback_url(:protocol => 'http', :host => host, :user => 'admin@altimarc.com', :password => 'please')      
    when "Peformance"
      Rails.env.development? ? "http://zencoderfetcher/" : performance_zencoder_callback_url(:protocol => 'http', :host => host, :user => 'admin@altimarc.com', :password => 'please')
    end
  end
end
