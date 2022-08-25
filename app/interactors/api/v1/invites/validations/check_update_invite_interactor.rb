class Api::V1::Invites::Validations::CheckUpdateInviteInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    user = context.user
    params = context.params
    team_id = params[:team_id]
    invite_id = params[:id]

    invite = Invite.find_by(id: invite_id, team_id: team_id)

    if invite.present? && (invite.sender_id == user.id || invite.recipient_id == user.id)
      context.invite = invite
    else
      error = { invite: ["#{invite_id} not enough rights by team #{team_id}"] }
      context.message = "#{self.class.name} error: #{error}"
      context.error = error
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
