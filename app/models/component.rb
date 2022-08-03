class Component
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  extend Enumerize

  field :data, type: Hash, default: {}
  field :type, type: String
  enumerize :type, in: %i[good bad info], default: :info

  embedded_in :retro
end
