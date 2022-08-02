class Api::V1::Users::Actions::PrepareUserInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    user_params = context.user_params
    user = User.new(user_params)

    if user.valid?
      context.user = user
    else
      context.message = "#{self.class.name} error: #{user.errors.full_messages}"
      context.error = user.errors.messages
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
