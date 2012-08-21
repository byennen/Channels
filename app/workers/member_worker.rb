class MemberWorker

  @queue = :critical

  def self.perform(method, *args)
    self.send(method, *args)
  end

  def self.share_listen(options={})
    User.put_fb_connection(options["user_id"], "#{APP_CONFIG['fb_namespace']}:listen", {song: options["song_url"]})
  end

  def self.share_view(options={})
    User.put_fb_connection(options["user_id"], "video.watches", {video: options["video_url"]})
  end

  def self.share_read(options={})
    User.put_fb_connection(options["user_id"], "news.reads", {article: options["article_url"]})
  end
  
  def self.send_welcome(options={})
    MemberMailer.welcome(options["user_id"]).deliver
  end

end
