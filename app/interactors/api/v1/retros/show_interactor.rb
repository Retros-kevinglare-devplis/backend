module Api
  module V1
    module Retros
      class ShowInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::RetroCreateContractInteractor,
                 Validations::CheckReadRetroInteractor,
                 Validations::FindRetroInteractor,
                 Actions::ResponseRetroInteractor
      end
    end
  end
end
