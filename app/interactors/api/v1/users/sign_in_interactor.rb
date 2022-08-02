# frozen_string_literal: true

module Api
  module V1
    module Users
      class SignInInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::SignInContractInteractor,
                 Validations::FindUserInteractor,
                 Actions::PrepareAuthTokenInteractor,
                 Actions::GenerateJwtInteractor,
                 Actions::ExpiredAuthTokensInteractor,
                 Actions::SaveAuthTokenInteractor,
                 Actions::ResponseCreateInteractor
      end
    end
  end
end
