class Contracts::Api::V1::Invites::InviteUpdateContract < ApplicationContract
  params do
    required(:team_id).value(:string)
    required(:id).value(:string)
    required(:status).value(:string)
  end
end
