module Api
  module V1
    module Teams
      class ShowInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::FindTeamReadInteractor,
                 Actions::ResponseTeamInteractor
      end
    end
  end
end
