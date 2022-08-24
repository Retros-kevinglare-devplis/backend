module Api
  module V1
    module Invites
      class ShowInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::InviteCreateContractInteractor,
                 Validations::CheckReadInviteInteractor,
                 Validations::FindInviteInteractor,
                 Actions::ResponseInviteInteractor
      end
    end
  end
end
