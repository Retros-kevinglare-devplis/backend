class Api::V1::Collaborators::Actions::DestroyCollaboratorInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    collaborator = context.collaborator

    if collaborator.destroy
      context.data = {}
      context.status = :no_content
    else
      context.message = "#{self.class.name} error: #{collaborator.errors.full_messages}"
      context.error = collaborator.errors.messages
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
