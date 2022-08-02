module Api
  module V1
    module Users
      class RefreshInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::RefreshContractInteractor,
                 Validations::FindAuthTokenInteractor,
                 Actions::SetUserInteractor,
                 Actions::PrepareAuthTokenInteractor,
                 Actions::GenerateJwtInteractor,
                 Actions::ExpiredAuthTokensInteractor,
                 Actions::SaveAuthTokenInteractor,
                 Actions::ResponseAuthTokenInteractor
      end
    end
  end
end
