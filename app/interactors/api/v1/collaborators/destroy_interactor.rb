module Api
  module V1
    module Collaborators
      class DestroyInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::CollaboratorShowContractInteractor,
                 Validations::FindTeamInteractor,
                 Validations::CheckUpdateCollaboratorInteractor,
                 Validations::FindCollaboratorInteractor,
                 Actions::DestroyCollaboratorInteractor
      end
    end
  end
end
