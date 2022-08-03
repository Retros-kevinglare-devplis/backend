class Component
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  extend Enumerize

  field :data, type: Hash, default: {}
  field :type, type: String
  enumerize :type, in: %i[good bad info], default: :info

  embedded_in :retro

  after_save :send_message

  private

  def send_message
    ComponentMessageCableJob.perform_async(
      self.retro.id.to_s,
      self.retro.team.id.to_s,
      Api::V1::ComponentSerializer.new(self).serializable_hash
    )
  end
end
