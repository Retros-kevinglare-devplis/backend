module Api
  module V1
    module Invites
      class IndexInteractor < ApplicationInteractor
        include Interactor::Organizer

        organize Validations::InviteFindContractnteractor,
                 Validations::CheckReadInviteInteractor,
                 Validations::FindInvitesInteractor,
                 Actions::ResponseInvitesInteractor
      end
    end
  end
end
