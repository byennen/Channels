if Rails.env.develop?
  Koala::Utils.level = Logger::DEBUG
  Koala::Utils.logger = Rails.logger
end
