class Team
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id, type: BSON::ObjectId
  field :title, type: String
  field :deleted_at, type: Time

  index({ user_id: 1 })
  index({ deleted_at: 1 })

  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :retros, dependent: :destroy
  has_many :invites, dependent: :destroy
end
