class Api::V1::TeamsController < ApplicationController
  def index

  end

  def show
    result = Api::V1::Teams::ShowInteractor.call(params: { id: params[:id] }, user: user)
    render_json result
  end

  def create
    result = Api::V1::Teams::CreateInteractor.call(params: create_params.to_h, user: user)
    render_json result
  end

  def update

  end

  def destroy

  end

  private

  def create_params
    params.permit(:title)
  end
end
