class Api::V1::RetrosSerializer < ApplicationSerializer
  set_type :retro
  attributes :created_at, :updated_at
  belongs_to :team
end
