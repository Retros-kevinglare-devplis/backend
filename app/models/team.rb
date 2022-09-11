class Team
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :user_id, type: BSON::ObjectId
  field :title, type: String
  field :description, type: String

  index({ user_id: 1 })

  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :retros, dependent: :destroy
  has_many :invites, dependent: :destroy
end
