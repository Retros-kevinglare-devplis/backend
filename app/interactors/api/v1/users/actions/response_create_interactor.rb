class Api::V1::Users::Actions::ResponseCreateInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    access_token = context.access_token
    auth_token = context.auth_token
    access_token_expired_at = context.access_token_expired_at

    options = {
      include: [:user, :'user.username'],
      params: {
        access_token: access_token,
        access_token_expired_at: access_token_expired_at
      }
    }

    context.data = Api::V1::Users::AuthTokenSerializer.new(auth_token, options).serializable_hash

    context.status = :ok
  end
end
