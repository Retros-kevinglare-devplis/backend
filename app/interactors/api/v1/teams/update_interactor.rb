module Api
  module V1
    module Teams
      class UpdateInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::FindTeamUpdateInteractor,
                 Actions::UpdateTeamInteractor,
                 Actions::ResponseTeamInteractor
      end
    end
  end
end
