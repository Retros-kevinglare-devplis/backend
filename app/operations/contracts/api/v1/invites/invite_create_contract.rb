class Contracts::Api::V1::Invites::InviteCreateContract < ApplicationContract
  params do
    required(:team_id).value(:string)
    required(:id).value(:string)
  end
end
