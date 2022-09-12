module Api
  module V1
    module Collaborators
      class ShowInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::CollaboratorShowContractInteractor,
                 Validations::FindTeamInteractor,
                 Validations::FindCollaboratorInteractor,
                 Actions::ResponseCollaboratorInteractor
      end
    end
  end
end
