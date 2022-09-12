class Api::V1::Collaborators::Validations::FindCollaboratorsInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    team = context.team
    current_page = context.current_page
    per_page = context.per_page

    pagination = PaginationService.call(
      cursor: team.collaborators,
      current_page:,
      per_page:,
      path: 'api_v1_team_collaborators_path',
      path_ids: [team.id]
    )

    context.collaborators = pagination[:cursor]
    context.options = pagination[:options]
  end
end
