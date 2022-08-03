class Api::V1::Retros::Actions::UpdateRetroInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    params = context.params
    retro = context.retro

    if retro.update(params)
      context.retro = retro
    else
      context.message = "#{self.class.name} error: #{retro.errors.full_messages}"
      context.error = retro.errors.messages
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
