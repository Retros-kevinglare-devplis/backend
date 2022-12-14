class Api::V1::Invites::Validations::FindInvitesInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    team = context.team
    current_page = context.current_page
    per_page = context.per_page

    pagination = PaginationService.call(
      cursor: team.invites,
      current_page:,
      per_page:,
      path: 'api_v1_team_invites_path',
      path_ids: [team.id]
    )

    context.invites = pagination[:cursor]
    context.options = pagination[:options]
  end
end
