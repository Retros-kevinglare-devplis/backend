class Api::V1::Invites::Actions::ResponseInviteInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    invite = context.invite
    options = {
      include: [:team, :sender, :recipient] # @TODO: collaborator
    }
    context.data = Api::V1::InviteSerializer.new(invite, options).serializable_hash

    context.status = :ok
  end
end
