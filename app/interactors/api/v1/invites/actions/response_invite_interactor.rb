class Api::V1::Invites::Actions::ResponseInviteInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    invite = context.invite
    options = {
      include: %i[team sender recipient]
    }
    context.data = Api::V1::InviteSerializer.new(invite, options).serializable_hash

    context.status = :ok
  end
end
