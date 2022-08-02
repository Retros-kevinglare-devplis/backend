class Api::V1::TeamSerializer < ApplicationSerializer
  attributes :title, :created_at, :updated_at
  set_type :teams
end
