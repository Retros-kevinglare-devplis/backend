module Api
  module V1
    module Teams
      class UpdateInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::FindTeamByIdInteractor,
                 Actions::ResponseTeamInteractor
      end
    end
  end
end
