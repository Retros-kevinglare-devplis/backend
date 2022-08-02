# frozen_string_literal: true

module Api
  module V1
    module Users
      class SignUpInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::SignUpContractInteractor,
                 Actions::GenerationEncryptedPasswordInteractor,
                 Actions::PrepareUserInteractor,
                 Actions::PrepareAuthTokenInteractor,
                 Actions::GenerateJwtInteractor,
                 Actions::SaveUserInteractor,
                 Actions::SaveAuthTokenInteractor,
                 Actions::ResponseCreateInteractor
      end
    end
  end
end
