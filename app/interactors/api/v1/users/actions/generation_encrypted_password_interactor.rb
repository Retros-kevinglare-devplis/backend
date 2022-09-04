class Api::V1::Users::Actions::GenerationEncryptedPasswordInteractor < ApplicationInteractor
  include Interactor::Organizer

  PASSWORD_SALT = ENV['PASSWORD_SALT'].freeze

  def call
    params = context.params
    encrypted_password = Digest::SHA256.hexdigest(params[:password])
    encrypted_password = encrypted_password[0...4] + PASSWORD_SALT + encrypted_password.last(28)

    user_params = {
      email: params[:email],
      username: params[:username],
      first_name: params[:first_name],
      last_name: params[:last_name],
      encrypted_password:
    }

    context.user_params = user_params
  end
end
