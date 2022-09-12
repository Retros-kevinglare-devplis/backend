class Api::V1::Teams::Actions::ResponseTeamsInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    team = context.teams.presence || []
    options = context.options
    context.data = Api::V1::TeamsSerializer.new(team, options).serializable_hash

    context.status = :ok
  end
end
