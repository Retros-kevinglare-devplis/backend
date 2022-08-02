class ApplicationController < ActionController::API
  # before_action :authenticate_user!
  # helper_method :current_user, :authenticate_user!
  #
  def render_json(result, params: {})
    caller_method ||= caller_locations(1, 1)[0].label

    if result.success?
      response = result.data
    else
      Rails.logger.info(
        "Response #{user_id} ##{caller_method} - data: #{result.data}, message: #{result.message}, params: #{params}"
      )
      response = { error: result.error }
      response[:message] = result.message if Rails.env.development?
    end

    render json: response, status: result.status
  end
  #
  # private
  #
  # def current_user
  #   @user = AuthService.get_client(token: request.headers['Authorization'])
  # end
  #
  # def user_logged_in?
  #
  # end
  #
  #
  def user_id
    defined?(@user).nil? ? nil : @user&.id
  end
end
