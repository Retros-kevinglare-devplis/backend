class Collaborator
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :user_id, type: BSON::ObjectId
  field :team_id, type: BSON::ObjectId
  field :status, type: Integer, default: 0

  index({ user_id: 1 })
  index({ team_id: 1 })

  belongs_to :user
  belongs_to :team
  has_one :invite
end
