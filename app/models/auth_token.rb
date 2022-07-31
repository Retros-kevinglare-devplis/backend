class AuthToken
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id, type: BSON::ObjectId
  field :refresh_token, type: String
  field :fingerprint, type: String
  field :expired_at, type: Time
  field :deleted_at, type: Time

  index({ user_id: 1 }, {})
  index({ refresh_token: 1 }, { unique: true })
  index({ deleted_at: 1 }, {})

  belongs_to :user

  validates :refresh_token, :expired_at, presence: true
end
