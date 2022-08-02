class Api::V1::Teams::Actions::CreateTeamInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    params = context.params
    user = context.user

    team = user.teams.build(params)

    if team.save
      context.team = team
    else
      context.message = "#{self.class.name} error: #{team.errors.full_messages}"
      context.error = team.errors.messages
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
