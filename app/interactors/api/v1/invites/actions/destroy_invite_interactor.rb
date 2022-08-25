class Api::V1::Invites::Actions::DestroyInviteInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    invite = context.invite

    if invite.destroy
      context.data = {}
      context.status = :no_content
    else
      context.message = "#{self.class.name} error: #{team.errors.full_messages}"
      context.error = invite.errors.messages
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
