if Rails.env == "production"
# set credentials from ENV hash
S3_CREDENTIALS = { :access_key_id => ENV['AKIAITWQ62YJ623WLY4Q'], :secret_access_key => ENV['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'], :bucket => "frywer"}
else
# get credentials from YML file
S3_CREDENTIALS = Rails.root.join("config/s3.yml")
end