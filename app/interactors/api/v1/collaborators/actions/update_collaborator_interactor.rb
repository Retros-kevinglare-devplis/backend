class Api::V1::Collaborators::Actions::UpdateCollaboratorInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    collaborator = context.collaborator
    params = context.params
    update_params = { status: params[:status] }

    if collaborator.update(update_params)
      context.collaborator = collaborator
    else
      context.message = "#{self.class.name} error: #{collaborator.errors.full_messages}"
      context.error = collaborator.errors.messages
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
