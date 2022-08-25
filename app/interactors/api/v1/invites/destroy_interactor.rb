module Api
  module V1
    module Invites
      class DestroyInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::InviteShowContractInteractor,
                 Validations::CheckUpdateInviteInteractor,
                 Actions::DestroyInviteInteractor
      end
    end
  end
end
