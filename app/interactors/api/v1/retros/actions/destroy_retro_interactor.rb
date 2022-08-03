class Api::V1::Retros::Actions::DestroyRetroInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    retro = context.retro

    if retro.destroy
      context.data = {}
      context.status = :no_content
    else
      context.message = "#{self.class.name} error: #{team.errors.full_messages}"
      context.error = team.errors.messages
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
