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
      retro_id: retro.id.to_s,
      message: Api::V1::ComponentSerializer.new(q).serializable_hash.to_json
    )
  end
end
