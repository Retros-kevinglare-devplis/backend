class Api::V1::Teams::Validations::FindTeamByIdInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    user = context.user
    params = context.params
    team_id = params[:id]

    team = user.teams.find_by(id: team_id)
    if team.present?
      context.team = team
      return
    end

    team = user.collaborators.find_by(team_id: team_id)
    if team.present?
      context.team = team
      return
    end

    error = { team: 'Team not found' }
    context.message = "#{self.class.name} error: #{error.to_h}"
    context.error = error
    context.status = :not_found
    context.fail!
  end
end
