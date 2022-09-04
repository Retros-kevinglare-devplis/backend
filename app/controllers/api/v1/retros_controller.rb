class Api::V1::RetrosController < ApiController
  include Pagination

  def index
    result = Api::V1::Retros::IndexInteractor.call(params: retro_params_with_id, user:, per_page:,
                                                   current_page:)
    render_json result
  end

  def show
    result = Api::V1::Retros::ShowInteractor.call(params: retro_params_with_id, user:)
    render_json result
  end

  def create
    result = Api::V1::Retros::CreateInteractor.call(params: retro_params.to_h, user:)
    render_json result
  end

  def update
    result = Api::V1::Retros::UpdateInteractor.call(params: retro_params_with_id, user:)
    render_json result
  end

  def destroy
    result = Api::V1::Retros::DestroyInteractor.call(params: retro_params_with_id, user:)
    render_json result
  end

  private

  def retro_params_with_id
    retro_params.to_h.merge(id: params[:id])
  end

  def retro_params
    params.permit(:team_id, components: [:id, :type, { data: {} }])
  end
end
