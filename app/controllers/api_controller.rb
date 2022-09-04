class ApiController < ActionController::API
  include ActionController::Helpers

  SHOW_EXCEPTION = ActiveModel::Type::Boolean.new.cast(ENV['SHOW_EXCEPTION']).freeze

  before_action :authenticate_user!
  helper_method :user, :authenticate_user!

  rescue_from StandardError do |e|
    data = { error: { server: ['Houston we have a problem'] } }
    data[:exception] = e.message if SHOW_EXCEPTION
    render json: data, status: :internal_server_error
  end

  def render_json(result, params: {})
    caller_method ||= caller_locations(1, 1)[0].label
    log_message = "Response #{user_id} ##{caller_method}"

    if result.success?
      Rails.logger.info(
        "#{log_message} success - data: #{result.data}, message: #{result.message}, params: #{params}"
      )

      response = result.data
    else
      Rails.logger.error(
        "#{log_message} failure - error: #{result.error}, message: #{result.message}, params: #{params}"
      )

      response = { error: result.error }
      response[:exception] = result.message if SHOW_EXCEPTION
    end

    render json: response.deep_transform_keys { |f| f.to_s.camelize(:lower) }, status: result.status
  end

  private

  def authenticate_user!
    unless user_logged_in?
      render_json OpenStruct.new(
        error: { user: 'application registration data is invalid' },
        status: :unauthorized,
        message: "Token #{request.headers['Authorization']} invalid"
      )
    end
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
