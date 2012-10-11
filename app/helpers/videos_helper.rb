module VideosHelper
  def video_playlist(video)
    if video.class == Video
      sources = current_user && current_user.paid_member? ? video.sources : video.video_preview.sources
    else
      sources = video.sources
    end
    logger.debug("sources are #{sources.inspect}")
    s = []
    sources.each_with_index do |source, index|
      s << "#{index}: {src: '#{source[:src]}', type: '#{source[:type]}'}"
    end
    return s.join(',')
  end
  
  def include_next_episode_preview(current_user, next_video)
    logger.debug("next video is #{next_video.inspect}")
    if current_user && current_user.paid_member?
      s = video_playlist(next_video.video_preview)
      return ",{#{s}, config: {title: \"#{next_video.title}\",className: 'postad',disallowSkip: true}}"
    end
  end
  
end
