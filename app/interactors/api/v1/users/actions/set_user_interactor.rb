class Api::V1::Users::Actions::SetUserInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    auth_token = context.auth_token
    context.user = auth_token.user
  end
end
