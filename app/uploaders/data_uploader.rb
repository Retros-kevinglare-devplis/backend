require 'carrierwave/mongoid'
require 'rmagick'

class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :fog

  version :thumb do
    process resize_to_fill: [150, 150]
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end
end