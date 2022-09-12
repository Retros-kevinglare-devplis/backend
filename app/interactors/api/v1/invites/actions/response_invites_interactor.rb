class Api::V1::Invites::Actions::ResponseInvitesInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    invites = context.invites.presence || []
    options = context.options

    context.data = Api::V1::InvitesSerializer.new(invites, options).serializable_hash
    context.status = :ok
  end
end
