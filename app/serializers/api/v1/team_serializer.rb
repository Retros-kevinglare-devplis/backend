class Api::V1::TeamSerializer < ApplicationSerializer
  attributes :title, :created_at, :updated_at

  attribute :user_id do |object|
    object.user_id.to_s
  end
end
