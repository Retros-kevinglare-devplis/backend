class Api::V1::UsersController < ApplicationController
  # skip_before_action :authenticate_user!

  def sign_up
    result = Api::V1::Users::SignUpInteractor.call(params: sign_up_params.to_h)
    render_json result
  end

  def sign_in
    result = Api::V1::Users::SignInInteractor.call(params: sign_in_params.to_h)
    render_json result
  end

  private

  def sign_up_params
    params.permit(:email, :first_name, :last_name, :username, :password, :fingerprint)
  end

  def sign_in_params
    params.permit(:email, :password, :fingerprint)
  end
end
