class Api::V1::UsersController < ApiController
  skip_before_action :authenticate_user!, only: %i[sign_up sign_in refresh]

  def sign_up
    result = Api::V1::Users::SignUpInteractor.call(params: sign_up_params.to_h)
    render_json result
  end

  def sign_in
    result = Api::V1::Users::SignInInteractor.call(params: sign_in_params.to_h)
    render_json result
  end

  def refresh
    result = Api::V1::Users::RefreshInteractor.call(params: refresh_params.to_h)
    render_json result
  end

  def whoami
    render json: Api::V1::UserSerializer.new(user).serializable_hash
  end

  private

  def sign_up_params
    params.permit(:email, :first_name, :last_name, :username, :password, :fingerprint)
  end

  def sign_in_params
    params.permit(:email, :password, :fingerprint)
  end

  def refresh_params
    params.permit(:refresh_token, :fingerprint)
  end
end
