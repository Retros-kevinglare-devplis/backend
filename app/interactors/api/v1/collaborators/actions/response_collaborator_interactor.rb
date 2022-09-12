class Api::V1::Collaborators::Actions::ResponseCollaboratorInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    collaborator = context.collaborator
    options = {
      include: %i[user team]
    }

    context.data = Api::V1::CollaboratorSerializer.new(collaborator, options).serializable_hash
    context.status = :ok
  end
end
