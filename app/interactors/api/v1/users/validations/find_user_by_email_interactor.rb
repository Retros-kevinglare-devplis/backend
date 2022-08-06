class Api::V1::Users::Validations::FindUserByEmailInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    params = context.params
    user = User.find_by(email: params[:email])
    return if user.blank?

    error = { user: ['User already exist']}
    context.message = "#{self.class.name} error: #{error}"
    context.error = error
    context.status = :unprocessable_entity
    context.fail!
  end
end
