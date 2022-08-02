class Contracts::Api::V1::Users::SignInContract < ApplicationContract
  params do
    required(:email).value(:string)
    required(:password).value(:string)
    optional(:fingerprint).value(:string)
  end
end
