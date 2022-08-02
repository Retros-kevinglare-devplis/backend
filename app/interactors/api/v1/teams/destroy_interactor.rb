module Api
  module V1
    module Teams
      class DestroyInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::FindTeamUpdateInteractor,
                 Actions::DestroyTeamInteractor
      end
    end
  end
end
