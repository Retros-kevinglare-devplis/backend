class Api::V1::CollaboratorSerializer < ApplicationSerializer
  attributes :created_at, :updated_at, :status

  belongs_to :user
  belongs_to :team
end
