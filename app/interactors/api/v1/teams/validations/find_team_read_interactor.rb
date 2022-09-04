class Api::V1::Teams::Validations::FindTeamReadInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    user = context.user
    team_id = context.team_id

    collaborator = user.collaborators.find_by(team_id:)
    if collaborator.present?
      context.team = collaborator.team
    else
      error = { team: ["#{team_id} not found"] }
      context.message = "#{self.class.name} error: #{error.to_h}"
      context.error = error
      context.status = :not_found
      context.fail!
    end
  end
end
