class Contracts::Api::V1::Invites::InviteIndexContract < ApplicationContract
  params do
    required(:team_id).value(:string)
  end
end
