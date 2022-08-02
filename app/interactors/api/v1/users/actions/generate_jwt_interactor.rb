class Api::V1::Users::Actions::GenerateJwtInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    user = context.user
    auth_token = context.auth_token
    access_token_expired_at = 1.day.from_now


    payload = {
      user_id: user.id,
      username: user.username,
      first_name: user.first_name,
      last_name: user.last_name,
      auth_token_id: auth_token.id,
      exp: access_token_expired_at.to_i
    }

    access_token = AuthService.encode(payload: payload)

    context.access_token = access_token
    context.access_token_expired_at = access_token_expired_at
  end
end
