class Contracts::Api::V1::Teams::TeamContract < ApplicationContract
  params do
    required(:title).value(:string)
  end
end
