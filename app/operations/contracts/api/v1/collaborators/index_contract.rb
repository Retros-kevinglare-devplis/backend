class Contracts::Api::V1::Collaborators::IndexContract < ApplicationContract
  params do
    required(:team_id).value(:string)
  end
end
