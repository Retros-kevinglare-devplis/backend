class Api::V1::Collaborators::Validations::CheckUpdateCollaboratorInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    user = context.user
    params = context.params
    team = context.team
    team_id = params[:team_id]

    collaborator = Collaborator.find_by(
      user_id: user.id, team_id:, status: { '$in': [Collaborator::STATUS_OWNER, Collaborator::STATUS_ADMIN] }
    )

    if collaborator.present?
      context.team = collaborator.team
    else
      error = { collaborator: ["not enough rights by team #{team.id}"] }
      context.message = "#{self.class.name} error: #{error}"
      context.error = error
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
