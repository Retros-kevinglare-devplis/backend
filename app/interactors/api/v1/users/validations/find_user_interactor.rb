class Api::V1::Users::Validations::FindUserInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    params = context.params
    user = User.find_by(email: params[:email], encrypted_password: Digest::SHA256.hexdigest(params[:password]))

    if user.present?
      context.user = user
    else
      error = { user: 'User not found'}
      context.message = "#{self.class.name} error: #{error}"
      context.error = error
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
