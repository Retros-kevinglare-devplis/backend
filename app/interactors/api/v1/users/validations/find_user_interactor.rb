class Api::V1::Users::Validations::FindUserInteractor < ApplicationInteractor
  include Interactor::Organizer

  PASSWORD_SALT = ENV['PASSWORD_SALT'].freeze

  def call
    params = context.params
    encrypted_password = Digest::SHA256.hexdigest(params[:password])
    encrypted_password = encrypted_password[0...4] + PASSWORD_SALT + encrypted_password.last(28)
    user = User.find_by(email: params[:email], encrypted_password: encrypted_password)

    if user.present?
      context.user = user
    else
      error = { user: ['User not found']}
      context.message = "#{self.class.name} error: #{error}"
      context.error = error
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
