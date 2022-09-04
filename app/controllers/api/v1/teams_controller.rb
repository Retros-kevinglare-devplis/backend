class Api::V1::TeamsController < ApiController
  include Pagination

  def index
    result = Api::V1::Teams::IndexInteractor.call(user:, per_page:, current_page:)
    render_json result
  end

  def show
    result = Api::V1::Teams::ShowInteractor.call(team_id: params[:id], user:)
    render_json result
  end

  def create
    result = Api::V1::Teams::CreateInteractor.call(params: team_params.to_h, user:)
    render_json result
  end

  def update
    result = Api::V1::Teams::UpdateInteractor.call(params: team_params.to_h, user:, team_id: params[:id])
    render_json result
  end

  def destroy
    result = Api::V1::Teams::DestroyInteractor.call(team_id: params[:id], user:)
    render_json result
  end

  private

  def team_params
    params.permit(:title)
  end
end
