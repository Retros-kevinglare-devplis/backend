class Api::V1::Invites::Actions::UpdateInviteInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    invite = context.invite
    params = context.params
    update_params = { status: params[:status] }

    update_params[:recipient_id] = User.find_by(email: params[:email]) if invite.recipient.nil?

    if invite.update(update_params)
      context.invite = invite
    else
      context.message = "#{self.class.name} error: #{invite.errors.full_messages}"
      context.error = invite.errors.messages
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
