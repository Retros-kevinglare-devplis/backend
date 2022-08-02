class Contracts::Api::V1::Users::SignUpContract < ApplicationContract
  params do
    required(:email).value(:string)
    required(:first_name).value(:string)
    required(:last_name).value(:string)
    required(:username).value(:string)
    required(:password).value(:string)
    optional(:fingerprint).value(:string)
  end
end
