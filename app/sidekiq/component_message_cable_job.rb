class ComponentMessageCableJob < SidekiqJob
  sidekiq_options queue: :components

  def perform(retro_id, message)
    retro = Retro.find_by(id: retro_id)
    RetroChannel.broadcast_to retro, message
  end
end