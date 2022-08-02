class Api::V1::Users::Actions::GenerationEncryptedPasswordInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    params = context.params
    user_params = {
      email: params[:email],
      username: params[:username],
      first_name: params[:first_name],
      last_name: params[:last_name],
      encrypted_password: Digest::SHA256.hexdigest(params[:password])
    }

    context.user_params = user_params
  end
end
