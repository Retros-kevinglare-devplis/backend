class Api::V1::Users::Actions::ExpiredAuthTokensInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    user = context.user
    user.auth_tokens.where(expired_at: Time.now..).update_all(expired_at: Time.now)
  end
end
