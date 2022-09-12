class Api::V1::CollaboratorsSerializer < ApplicationSerializer
  attributes :created_at, :updated_at, :status

  belongs_to :user
  belongs_to :team
end
