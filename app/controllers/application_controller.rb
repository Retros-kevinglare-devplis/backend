class ApplicationController < ActionController::API
  include ActionController::Helpers

  before_action :authenticate_user!
  helper_method :user, :authenticate_user!

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

  private

  def authenticate_user!
    render_json OpenStruct.new(
      error: { user: 'Application registration data not valid' },
      status: :unauthorized,
      message: "Token #{request.headers['Authorization']} invalid"
    ) unless user_logged_in?
  end

  def user
    @user ||= AuthService.get_user(token: request.headers['Authorization'])
  end

  def user_logged_in?
    !user.nil?
  end

  def user_id
    defined?(@user).nil? ? nil : @user&.id
  end
end
