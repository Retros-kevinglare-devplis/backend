class Api::V1::Retros::Actions::CreateRetroInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    params = context.params
    team = context.team
    retro = team.retros.build(params)

    if retro.save
      context.retro = retro
    else
      context.message = "#{self.class.name} error: #{retro.errors.full_messages}"
      context.error = retro.errors.messages
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
