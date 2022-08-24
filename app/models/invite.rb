class Invite
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  extend Enumerize

  field :sender_id, type: BSON::ObjectId
  field :recipient_id, type: BSON::ObjectId
  field :team_id, type: BSON::ObjectId
  field :collaboration_id, type: BSON::ObjectId
  field :email, type: String
  field :expired_at, type: Time
  field :token, type: String
  field :status, type: Integer

  index({ sender_id: 1 })
  index({ recipient_id: 1 })
  index({ team_id: 1 })
  index({ collaboration_id: 1 })
  index({ email: 1 })
  index({ token: 1 }, { unique: true })

  validates :email, :expired_at, :token, :sender_id, presence: true

  belongs_to :sender, class_name: 'User', inverse_of: :sender_invites
  belongs_to :recipient, class_name: 'User', inverse_of: :recipient_invites, optional: true
  belongs_to :collaborator, optional: true
  belongs_to :team

  STATUS_WAITING = 0
  STATUS_APPROVED = 1
  STATUS_REJECTED = 2
  STATUSES = { waiting: STATUS_WAITING, approved: STATUS_APPROVED, rejected: STATUS_REJECTED }.freeze
  enumerize :status, in: STATUSES, default: STATUS_WAITING
end
