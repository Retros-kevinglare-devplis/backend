class Api::V1::Retros::Actions::ResponseRetroInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    retro = context.retro
    options = {
      include: [:team, :components]
    }
    context.data = Api::V1::RetroSerializer.new(retro, options).serializable_hash

    context.status = :ok
  end
end
