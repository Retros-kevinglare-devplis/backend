class Api::V1::Invites::Actions::ResponseInvitesInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    invites = context.invites
    options = context.options.merge(include: [:team])

    context.data = Api::V1::InvitesSerializer.new(invites, options).serializable_hash
    context.status = :ok
  end
end
