class MemberWorker

  @queue = :critical

  def self.perform(method, *args)
    self.send(method, *args)
  end

  def self.share_listen(options={})
    Rails.logger.debug("optoins are #{options}")
    User.share_listen(options["user_id"], options["song_url"])
  end

  def send_welcome(options={})
  end

end
