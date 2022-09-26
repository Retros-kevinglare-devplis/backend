class Contracts::Api::V1::Teams::TeamContract < ApplicationContract
  params do
    required(:title).value(:string)
    optional(:description).value(:string)
    optional(:image_url).value(:string)
  end
end
