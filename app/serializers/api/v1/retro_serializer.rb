class Api::V1::RetroSerializer < ApplicationSerializer
  attributes :created_at, :updated_at
  belongs_to :team

  has_many :components do |object|
    object.components
  end
end
