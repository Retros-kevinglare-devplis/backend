module Api
  module V1
    module Invites
      class CreateInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::InviteCreateContractInteractor,
                 Validations::CheckUpdateInviteInteractor,
                 Actions::CreateInviteInteractor,
                 Actions::ResponseInviteInteractor
      end
    end
  end
end
