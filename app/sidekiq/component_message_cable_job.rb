class ComponentMessageCableJob < SidekiqJob
  sidekiq_options queue: :components

  def perform(team_id, retro_id, message)
    channel = "v1_team_id_#{team_id}_retro_id_#{retro_id}_channel"

    Rails.logger.info("#{self.class.name} call channel: #{channel}, message: #{message}")

    ActionCable.server.broadcast channel, message
  end
end