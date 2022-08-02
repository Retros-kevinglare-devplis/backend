class Api::V1::Teams::Actions::ResponseTeamInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    team = context.team
    options = context.options.presence || {}
    context.data = Api::V1::TeamSerializer.new(team, options).serializable_hash

    context.status = :ok
  end
end
