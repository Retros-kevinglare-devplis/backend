class Contracts::Api::V1::Collaborators::UpdateContract < ApplicationContract
  params do
    required(:team_id).value(:string)
    required(:id).value(:string)
    required(:status).value(:string)
  end
end
