class Contracts::Api::V1::Retros::RetroCreateContract < ApplicationContract
  params do
    required(:team_id).value(:string)
  end
end
