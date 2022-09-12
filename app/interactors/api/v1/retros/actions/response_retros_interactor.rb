class Api::V1::Retros::Actions::ResponseRetrosInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    retros = context.retros.presence || []
    options = context.options.merge(include: [:team])

    context.data = Api::V1::RetrosSerializer.new(retros, options).serializable_hash
    context.status = :ok
  end
end
