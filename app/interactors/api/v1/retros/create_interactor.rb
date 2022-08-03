module Api
  module V1
    module Retros
      class CreateInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::RetroCreateContractInteractor,
                 Validations::CheckUpdateRetroInteractor,
                 Actions::CreateRetroInteractor,
                 Actions::ResponseRetroInteractor
      end
    end
  end
end
