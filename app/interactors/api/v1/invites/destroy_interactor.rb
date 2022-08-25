module Api
  module V1
    module Invites
      class DestroyInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::InviteShowContractInteractor,
                 Validations::CheckUpdateInviteInteractor,
                 Validations::FindInviteInteractor,
                 Actions::DestroyInviteInteractor
      end
    end
  end
end
