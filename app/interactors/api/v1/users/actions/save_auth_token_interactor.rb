class Api::V1::Users::Actions::SaveAuthTokenInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    auth_token = context.auth_token
    return if auth_token.save

    context.message = "#{self.class.name} error: #{auth_token.errors.full_messages}"
    context.error = auth_token.errors.messages
    context.status = :unprocessable_entity
    context.fail!
  end
end
