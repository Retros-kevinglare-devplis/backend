class Api::V1::Users::Validations::FindAuthTokenInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    params = context.params
    auth_token = AuthToken.find_by(refresh_token: params[:refresh_token], expired_at: Time.current..)

    if auth_token.present?
      context.auth_token = auth_token
    else
      error = { auth_token: ['AuthToken not found'] }
      context.message = "#{self.class.name} error: #{error}"
      context.error = error
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
