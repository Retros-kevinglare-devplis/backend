class Api::V1::InvitesSerializer < ApplicationSerializer
  set_type :invite

  attributes  :email, :expired_at, :status, :created_at, :updated_at

  belongs_to :sender, serializer: Api::V1::UserSerializer
  belongs_to :recipient, serializer: Api::V1::UserSerializer, if: Proc.new { |i| i.recipient.present? }
  belongs_to :team
end
