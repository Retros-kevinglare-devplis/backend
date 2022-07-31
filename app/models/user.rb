class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email, type: String
  field :encrypted_password, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :username, type: String
  field :deleted_at, type: Time

  index({ username: 1 }, { unique: true })
  index({ email: 1 }, { unique: true })
  index({ deleted_at: 1 })

  validates :email, :username, :first_name, :last_name, :encrypted_password, presence: true

  has_many :auth_tokens, dependent: :destroy
  has_many :sender_invites, class_name: 'Invite', dependent: :destroy
  has_many :recipient_invites, class_name: 'Invite', dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :collaborators, dependent: :destroy
end
