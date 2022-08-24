class Api::V1::Invites::Validations::FindInviteInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    team = context.team
    params = context.params
    invite_id = params[:id]
    team_id = params[:team_id]

    invite = team.invites.find_by(id: invite_id)

    if invite.present?
      context.invite = invite
    else
      error = { invite: ["Invite #{invite_id} not found by team #{team_id}"] }
      context.message = "#{self.class.name} error: #{error}"
      context.error = error
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
