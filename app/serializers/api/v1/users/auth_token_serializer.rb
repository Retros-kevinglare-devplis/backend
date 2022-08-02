class Api::V1::Users::AuthTokenSerializer < ApplicationSerializer
  attributes :refresh_token

  attribute :refresh_token_expired_at do |object|
    object.expired_at
  end

  attribute :access_token do |_, params|
    params[:access_token]
  end

  attribute :access_token_expired_at do |_, params|
    params[:access_token_expired_at]
  end

  belongs_to :user
end
