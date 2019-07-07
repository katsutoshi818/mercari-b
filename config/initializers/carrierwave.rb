require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: 'ap-northeast-1'
  }
  config.storage = :fog
  config.fog_provider = 'fog/aws'

  config.fog_directory  = 'mercari-b'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercari-b'
end