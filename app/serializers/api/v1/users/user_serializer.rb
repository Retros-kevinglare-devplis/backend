class Api::V1::Users::UserSerializer < ApplicationSerializer
  attributes :username, :email, :first_name, :last_name
end
