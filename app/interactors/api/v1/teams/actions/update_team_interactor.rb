class Api::V1::Teams::Actions::UpdateTeamInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    params = context.params
    team = context.team

    if team.update(params)
      context.team = team
    else
      context.message = "#{self.class.name} error: #{team.errors.full_messages}"
      context.error = team.errors.messages
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
