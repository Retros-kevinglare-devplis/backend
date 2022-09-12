class Contracts::Api::V1::Invites::ShowContract < ApplicationContract
  params do
    required(:team_id).value(:string)
    required(:id).value(:string)
  end
end
