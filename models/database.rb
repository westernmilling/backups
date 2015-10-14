# encoding: utf-8

Model.new(:database, 'Database backup to S3') do
  database MySQL do |db|
    db.name               = :all
    db.username           = Figaro.env.DATABASE_USER
    db.password           = Figaro.env.DATABASE_PASS
    db.host               = Figaro.env.DATABASE_HOST
    db.port               = 3306
  end

  store_with S3 do |s3|
    s3.access_key_id     = Figaro.env.S3_ACCESS_KEY_ID
    s3.secret_access_key = Figaro.env.S3_ACCESS_KEY_SECRET
    # Or, to use a IAM Profile:
    # s3.use_iam_profile = true

    s3.region            = Figaro.env.S3_REGION
    s3.bucket            = Figaro.env.S3_BUCKET
    # s3.path              = Figaro.env.S3_PATH unless Figaro.env.S3_PATH == ''
  end

  compress_with Gzip

  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_warning           = true
    mail.on_failure           = true

    mail.from                 = Figaro.env.MAIL_FROM
    mail.to                   = Figaro.env.MAIL_TO
    mail.address              = Figaro.env.MAIL_HOST
    # mail.port                 = 587
    # mail.domain               = "your.host.name"
    mail.authentication       = "plain"
  end
end
