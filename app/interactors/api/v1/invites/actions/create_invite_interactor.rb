class Api::V1::Invites::Actions::CreateInviteInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    params = context.params
    team = context.team
    user = context.user

    invite = team.invites.build(
      {
        sender: user.id,
        recipient: User.find_by(email: params[:email]),
        email: params[:email],
        expired_at: Time.current + 3.days,
        token: SecureRandom.hex
      }
    )

    if invite.save
      context.invite = invite
    else
      context.message = "#{self.class.name} error: #{invite.errors.full_messages}"
      context.error = invite.errors.messages
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
