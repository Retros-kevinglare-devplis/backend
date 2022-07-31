class Retro
  include Mongoid::Document
  include Mongoid::Timestamps

  field :team_id, type: BSON::ObjectId
  field :deleted_at, type: Time

  index({ team_id: 1 })
  index({ deleted_at: 1 })

  belongs_to :team
end
