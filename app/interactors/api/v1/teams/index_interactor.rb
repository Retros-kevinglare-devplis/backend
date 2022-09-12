module Api
  module V1
    module Teams
      class IndexInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::FindTeamsReadInteractor,
                 Actions::ResponseTeamsInteractor
      end
    end
  end
end
