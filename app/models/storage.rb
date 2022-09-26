class Storage
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  mount_uploader :file, FileUploader, mount_on: :filename
end
