class Api::V1::Teams::Validations::FindTeamsReadInteractor < ApplicationInteractor
  include Interactor::Organizer
  include Rails.application.routes.url_helpers

  def call
    user = context.user
    current_page = context.current_page
    per_page = context.per_page

    teams = user.teams_collaborators.limit(per_page).page(current_page)
    context.options = {
      links: {
        first: api_v1_teams_path(per_page: per_page),
        self: api_v1_teams_path(page: current_page, per_page: per_page),
        last: api_v1_teams_path(page: teams.total_pages, per_page: per_page)
      }
    }
    context.team = teams
  end
end
