class Api::V1::Retros::Validations::FindRetrosInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    team = context.team
    current_page = context.current_page
    per_page = context.per_page

    pagination = PaginationService.call(
      cursor: team.retros,
      current_page: current_page,
      per_page: per_page,
      path: 'api_v1_teams_path'
    )

    context.retros = pagination[:cursor]
    context.options = pagination[:options]
  end
end
