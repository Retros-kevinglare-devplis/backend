module Api
  module V1
    module Collaborators
      class IndexInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::CollaboratorIndexContractInteractor,
                 Validations::FindTeamInteractor,
                 Validations::FindCollaboratorsInteractor,
                 Actions::ResponseCollaboratorsInteractor
      end
    end
  end
end
