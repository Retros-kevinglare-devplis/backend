class Api::V1::Collaborators::Actions::ResponseCollaboratorsInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    collaborators = context.collaborators.presence || []
    options = context.options

    context.data = Api::V1::CollaboratorsSerializer.new(collaborators, options).serializable_hash
    context.status = :ok
  end
end
