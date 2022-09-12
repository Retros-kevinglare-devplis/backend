class Contracts::Api::V1::Invites::CreateContract < ApplicationContract
  params do
    required(:team_id).value(:string)
    required(:email).value(:string)
  end
end
