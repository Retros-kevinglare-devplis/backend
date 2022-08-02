class Contracts::Api::V1::Users::RefreshContract < ApplicationContract
  params do
    required(:refresh_token).value(:string)
    optional(:fingerprint).value(:string)
  end
end
