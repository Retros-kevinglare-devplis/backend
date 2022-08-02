class Api::V1::Users::Actions::PrepareAuthTokenInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    user = context.user
    params = context.params
    auth_token_params = {
      refresh_token: SecureRandom.hex,
      expired_at: Time.current + 1.week,
      fingerprint: params[:fingerprint]
    }

    auth_token = user.auth_tokens.build(auth_token_params)

    if auth_token.valid?
      context.auth_token = auth_token
    else
      context.message = "#{self.class.name} error: #{auth_token.errors.full_messages}"
      context.error = auth_token.errors.messages
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
