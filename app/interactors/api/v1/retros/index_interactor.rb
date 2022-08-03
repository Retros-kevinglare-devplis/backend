module Api
  module V1
    module Retros
      class IndexInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::RetroCreateContractInteractor,
                 Validations::CheckReadRetroInteractor,
                 Validations::FindRetrosInteractor,
                 Actions::ResponseRetrosInteractor
      end
    end
  end
end
