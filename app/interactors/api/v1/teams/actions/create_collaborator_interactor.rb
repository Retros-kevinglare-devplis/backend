class Api::V1::Teams::Actions::CreateCollaboratorInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    user = context.user
    team = context.team

    collaborator = team.collaborators.build({ user_id: user.id, status: Collaborator::STATUS_OWNER })
    return if collaborator.save

    context.message = "#{self.class.name} error: #{collaborator.errors.full_messages}"
    context.error = collaborator.errors.messages
    context.status = :unprocessable_entity
    context.fail!
  end
end
