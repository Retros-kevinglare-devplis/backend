class Api::V1::Users::Actions::ResponseAuthTokenInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    access_token = context.access_token
    auth_token = context.auth_token
    access_token_expired_at = context.access_token_expired_at

    options = {
      include: [:user],
      params: {
        access_token: access_token,
        access_token_expired_at: access_token_expired_at
      }
    }

    context.data = Api::V1::AuthTokenSerializer.new(auth_token, options).serializable_hash

    context.status = :ok
  end
end
