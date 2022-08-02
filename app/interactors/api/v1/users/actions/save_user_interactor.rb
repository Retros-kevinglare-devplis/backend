class Api::V1::Users::Actions::SaveUserInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    user = context.user
    return if user.save

    context.message = "#{self.class.name} error: #{user.errors.full_messages}"
    context.error = user.errors.messages
    context.status = :unprocessable_entity
    context.fail!
  end
end
