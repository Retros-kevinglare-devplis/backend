class Contracts::Api::V1::Invites::IndexContract < ApplicationContract
  params do
    required(:team_id).value(:string)
  end
end
