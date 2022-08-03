module Api
  module V1
    module Retros
      class UpdateInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::RetroCreateContractInteractor,
                 Validations::CheckReadRetroInteractor,
                 Validations::FindRetroInteractor,
                 Actions::UpdateRetroInteractor,
                 Actions::ResponseRetroInteractor
      end
    end
  end
end
