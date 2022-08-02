class Api::V1::CollaboratorSerializer < ApplicationSerializer
  attributes :created_at, :updated_at, :status

  attribute :user_id do |object|
    object.user_id.to_s
  end

  attribute :team_id do |object|
    object.team_id.to_s
  end

  belongs_to :user
  belongs_to :team
end
