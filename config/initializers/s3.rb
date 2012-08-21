if Rails.env.development?
  ENV['S3_UPLOADER_BUCKET'] = "altimarc-test"
  ENV['S3_UPLOADER_ACCESS_KEY'] = "AKIAIPHZNJZ5QBOUOTHA"
  ENV['S3_UPLOADER_SECRET_ACCESS_KEY'] = "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"
end