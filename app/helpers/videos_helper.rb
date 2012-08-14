module VideosHelper
  def video_playlist(video)
    if video.class == Video
      sources = current_user && current_user.paid_member? ? video.sources : video.video_preview.sources
    else
      sources = video.sources
    end
    s = []
    sources.each_with_index do |source, index|
      s << "#{index}: {src: '#{source[:src]}', type: '#{source[:type]}'}"
    end
    return s.join(',')
  end
end
