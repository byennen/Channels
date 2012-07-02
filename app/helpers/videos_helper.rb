module VideosHelper

  def video_playlist(sources)
    s = []
    sources.each_with_index do |source, index|
      s << {index => {src: source[:src], type: source[:type]}}.to_json
    end
    return s.join(',')
  end
end
