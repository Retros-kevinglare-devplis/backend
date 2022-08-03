class Api::V1::ComponentSerializer < ApplicationSerializer
  attributes :data, :type, :created_at, :updated_at
end
