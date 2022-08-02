module Api
  module V1
    module Teams
      class CreateInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::TeamContractInteractor,
                 Actions::CreateTeamInteractor,
                 Actions::ResponseTeamInteractor
      end
    end
  end
end
