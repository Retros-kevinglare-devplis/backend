class Api::V1::Teams::Validations::FindTeamsReadInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    user = context.user
    current_page = context.current_page
    per_page = context.per_page

    pagination = PaginationService.call(
      cursor: user.teams_collaborators,
      current_page: current_page,
      per_page: per_page,
      path: 'api_v1_teams_path'
    )

    context.team = pagination[:cursor]
    context.options = pagination[:options]
  end
end
