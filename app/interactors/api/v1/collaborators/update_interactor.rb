module Api
  module V1
    module Collaborators
      class UpdateInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::CollaboratorUpdateContractInteractor,
                 Validations::FindTeamInteractor,
                 Validations::CheckUpdateCollaboratorInteractor,
                 Validations::FindCollaboratorInteractor,
                 Actions::UpdateCollaboratorInteractor,
                 Actions::ResponseCollaboratorInteractor
      end
    end
  end
end
