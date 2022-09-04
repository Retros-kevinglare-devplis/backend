class Collaborator
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  extend Enumerize

  field :user_id, type: BSON::ObjectId
  field :team_id, type: BSON::ObjectId
  field :status, type: Integer

  index({ user_id: 1 })
  index({ team_id: 1 })
  index({ user_id: 1, team_id: 1 } , { unique: true })

  belongs_to :user
  belongs_to :team
  has_one :invite

  STATUS_OWNER = 0
  STATUS_ADMIN = 1
  STATUS_MEMBER = 2
  STATUS_VIEWER = 3
  STATUSES = { owner: STATUS_OWNER, admin: STATUS_ADMIN, member: STATUS_MEMBER, viewer: STATUS_VIEWER }.freeze
  enumerize :status, in: STATUSES, default: STATUS_VIEWER
end
