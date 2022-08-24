class Api::V1::InviteSerializer < ApplicationSerializer
  set_type :invite

  attributes  :email, :expired_at, :token, :status, :created_at, :updated_at

  attribute :team_id do |object|
    object.team_id.to_s
  end

  attribute :sender_id do |object|
    object.sender_id.to_s
  end

  attribute :recipient_id do |object|
    object.recipient_id.to_s if object.recipient_id.present?
  end

  attribute :collaboration_id do |object|
    object.collaboration_id.to_s if object.collaboration_id.present?
  end

  belongs_to :sender, serializer: Api::V1::UserSerializer
  belongs_to :recipient, serializer: Api::V1::UserSerializer, if: Proc.new { |i| i.recipient.present? }
  belongs_to :team
end
