class Api::V1::Collaborators::Validations::FindCollaboratorInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    team = context.team
    params = context.params
    collaborator_id = params[:id]
    team_id = params[:team_id]

    collaborator = team.collaborators.find_by(id: collaborator_id)

    if collaborator.present?
      context.collaborator = collaborator
    else
      error = { collaborator: ["#{collaborator_id} not found by team #{team_id}"] }
      context.message = "#{self.class.name} error: #{error}"
      context.error = error
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
