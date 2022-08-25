module Api
  module V1
    module Invites
      class IndexInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::InviteIndexContractInteractor,
                 Validations::FindTeamInteractor,
                 Validations::FindInvitesInteractor,
                 Actions::ResponseInvitesInteractor
      end
    end
  end
end
