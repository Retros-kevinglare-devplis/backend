class Retro
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :team_id, type: BSON::ObjectId

  index({ team_id: 1 })

  belongs_to :team
end
