class Api::V1::RetrosSerializer < ApplicationSerializer
  attributes :created_at, :updated_at
  belongs_to :team
  set_type :retro
end
