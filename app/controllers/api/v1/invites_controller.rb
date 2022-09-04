class Api::V1::InvitesController < ApiController
  include Pagination

  def index
    result = Api::V1::Invites::IndexInteractor.call(params: invite_params_with_id, user:, per_page:,
                                                    current_page:)
    render_json result
  end

  def show
    result = Api::V1::Invites::ShowInteractor.call(params: invite_params_with_id, user:)
    render_json result
  end

  def create
    result = Api::V1::Invites::CreateInteractor.call(params: invite_params.to_h, user:)
    render_json result
  end

  def update
    result = Api::V1::Invites::UpdateInteractor.call(params: invite_params_with_id, user:)
    render_json result
  end

  def destroy
    result = Api::V1::Invites::DestroyInteractor.call(params: invite_params_with_id, user:)
    render_json result
  end

  private

  def invite_params_with_id
    invite_params.to_h.merge(id: params[:id])
  end

  def invite_params
    params.permit(:team_id, :email, :status)
  end
end
