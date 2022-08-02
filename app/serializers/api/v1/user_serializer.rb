class Api::V1::UserSerializer < ApplicationSerializer
  attributes :username, :email, :first_name, :last_name
end
