module Api
  module V1
    module Invites
      class UpdateInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::InviteUpdateContractInteractor,
                 Validations::FindTeamInteractor,
                 Validations::FindInviteInteractor,
                 Validations::CheckUpdateInviteInteractor,
                 Actions::UpdateInviteInteractor,
                 Actions::ResponseInviteInteractor
      end
    end
  end
end
