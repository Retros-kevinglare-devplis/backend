class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :email, type: String
  field :encrypted_password, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :username, type: String

  index({ username: 1 }, { unique: true })
  index({ email: 1 }, { unique: true })

  validates :email, :username, :first_name, :last_name, :encrypted_password, presence: true

  has_many :auth_tokens, dependent: :destroy
  has_many :sender_invites, class_name: 'Invite', inverse_of: :evil_wizard, dependent: :destroy
  has_many :recipient_invites, class_name: 'Invite', inverse_of: :evil_wizard, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :collaborators, dependent: :destroy

  after_create :send_sign_up_email

  def teams_collaborators
    Team.where(id: { '$in': collaborators.pluck(:team_id) })
  end

  def send_sign_up_email
    UserMailer.with(email: email).sign_up.deliver_later
  end
end
