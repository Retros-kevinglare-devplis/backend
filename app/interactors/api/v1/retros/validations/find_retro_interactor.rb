class Api::V1::Retros::Validations::FindRetroInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    team = context.team
    params = context.params
    retro_id = params[:id]
    team_id = params[:team_id]

    retro = team.retros.find_by(id: retro_id)

    if retro.present?
      context.retro = retro
    else
      error = { retro: ["#{retro_id} not found by team #{team_id}"] }
      context.message = "#{self.class.name} error: #{error}"
      context.error = error
      context.status = :unprocessable_entity
      context.fail!
    end
  end
end
