class Api::V1::CollaboratorsController < ApiController
  include Pagination

  def index
    result = Api::V1::Collaborators::IndexInteractor.call(
      params: collaborator_params_with_id, user:, per_page:, current_page:
    )
    render_json result
  end

  def show
    result = Api::V1::Collaborators::ShowInteractor.call(params: collaborator_params_with_id, user:)
    render_json result
  end

  def update
    result = Api::V1::Collaborators::UpdateInteractor.call(params: collaborator_params_with_id, user:)
    render_json result
  end

  def destroy
    result = Api::V1::Collaborators::DestroyInteractor.call(params: collaborator_params_with_id, user:)
    render_json result
  end

  private

  def collaborator_params_with_id
    collaborator_params.to_h.merge(id: params[:id])
  end

  def collaborator_params
    params.permit(:team_id, :status)
  end
end
