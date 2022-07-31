class Collaborator
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id, type: BSON::ObjectId
  field :team_id, type: BSON::ObjectId
  field :status, type: Integer, default: 0
  field :deleted_at, type: Time

  index({ user_id: 1 })
  index({ team_id: 1 })
  index({ deleted_at: 1 })

  belongs_to :user
  belongs_to :team
  has_one :invite
end
