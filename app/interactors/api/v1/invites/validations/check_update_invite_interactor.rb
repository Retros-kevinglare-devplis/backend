class Api::V1::Invites::Validations::CheckUpdateInviteInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    user = context.user
    params = context.params
    team = context.team
    team_id = params[:team_id]

    collaborator = user.collaborators.find_by(
      team_id: team_id, status: { '$in':[Collaborator::STATUS_OWNER, Collaborator::STATUS_ADMIN] }
    )

    if collaborator.present?
      context.team = collaborator.team
    else
      error = { invite: ["not enough rights by team #{team.id}"] }
      context.message = "#{self.class.name} error: #{error}"
      context.error = error
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
