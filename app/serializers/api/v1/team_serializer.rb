class Api::V1::TeamSerializer < ApplicationSerializer
  attributes :title, :description, :created_at, :updated_at

  belongs_to :user
  has_many :collaborators
  has_many :retros
  has_many :invites
end
