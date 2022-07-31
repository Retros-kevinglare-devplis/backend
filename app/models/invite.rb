class Invite
  include Mongoid::Document
  include Mongoid::Timestamps

  field :sender_id, type: BSON::ObjectId
  field :recipient_id, type: BSON::ObjectId
  field :team_id, type: BSON::ObjectId
  field :collaboration_id, type: BSON::ObjectId
  field :email, type: Time
  field :expired_at, type: Time
  field :token, type: String
  field :status, type: Integer, default: 0
  field :deleted_at, type: Time

  index({ sender_id: 1 })
  index({ recipient_id: 1 })
  index({ team_id: 1 })
  index({ collaboration_id: 1 })
  index({ email: 1 })
  index({ token: 1 }, { unique: true })
  index({ deleted_at: 1 })

  validates :email, :expired_at, :token, presence: true

  belongs_to :sender, class_name: 'User'
  belongs_to :recipient_id, class_name: 'User', optional: true
  belongs_to :collaborator, optional: true
  belongs_to :team
end
