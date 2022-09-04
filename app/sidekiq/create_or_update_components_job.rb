class CreateOrUpdateComponentsJob < SidekiqJob
  sidekiq_options queue: :components, retry: false

  def perform(retro_id:, message:)
    retro = Retro.find_by(id: retro_id)
    retro.components.create_or_update(message)
  end
end

