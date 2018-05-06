require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "907a69ba976fb891b76c680aa25d0f9c45760539c38cf7edfdbd96e0e5bb91d8"

  url_format "/media/:job/:name"

  if Rails.env.production? || Rails.env.staging?
    datastore :s3,
              bucket_name: ENV['S3_BUCKET'],
              access_key_id: ENV['S3_KEY'],
              secret_access_key: ENV['S3_SECRET'],
              region: ENV['S3_REGION'],
              url_scheme: 'https'
  else
    datastore :file,
      root_path: Rails.root.join('public/system/dragonfly', Rails.env),
        server_root: Rails.root.join('public')
  end

  # Logger
  Dragonfly.logger = Rails.logger

  # Mount as middleware
  Rails.application.middleware.use Dragonfly::Middleware

  # Add model functionality
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.extend Dragonfly::Model
    ActiveRecord::Base.extend Dragonfly::Model::Validations
  end
end
