class Api::V1::Teams::Actions::ResponseTeamInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    team = context.team
    context.data = Api::V1::TeamSerializer.new(team).serializable_hash

    context.status = :ok
  end
end
