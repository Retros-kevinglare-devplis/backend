class ApplicationController < ActionController::API
  # before_action :authenticate_user!
  # helper_method :current_user, :authenticate_user!
  #
  def render_json(result, params: {})
    caller_method ||= caller_locations(1, 1)[0].label
    log_message = "Response #{user_id} ##{caller_method}"

    if result.success?
      response = result.data
      Rails.logger.error(
        "#{log_message} success - data: #{result.data}, message: #{result.message}, params: #{params}"
      )
    else
      Rails.logger.error(
        "#{log_message} failure - error: #{result.error}, message: #{result.message}, params: #{params}"
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
