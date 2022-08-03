module Api
  module V1
    module Retros
      class DestroyInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::RetroCreateContractInteractor,
                 Validations::CheckUpdateRetroInteractor,
                 Validations::FindRetroInteractor,
                 Actions::DestroyRetroInteractor
      end
    end
  end
end
