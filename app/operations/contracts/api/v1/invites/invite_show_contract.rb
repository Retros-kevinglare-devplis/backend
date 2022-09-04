class Contracts::Api::V1::Invites::InviteShowContract < ApplicationContract
  params do
    required(:team_id).value(:string)
    required(:id).value(:string)
  end
end
