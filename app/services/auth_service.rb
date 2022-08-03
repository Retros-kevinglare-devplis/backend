class AuthService
  JWT_SECRET = ENV.fetch('JWT_SECRET').freeze

  class << self
    def encode(payload:)
      JWT.encode(payload, JWT_SECRET)
    end

    def decode(token:)
      decoded = JWT.decode(token, JWT_SECRET)[0]
      decoded.with_indifferent_access
    end

    def get_user_ws(token:)
      return if token.blank?

      find_user(token: token)
    end

    def get_user(token:)
      token = token.split(' ')
      return if token.length != 2
      return if token.first != 'Bearer'

      find_user(token: token.last)
    end

    def find_user(token: )
      jwt = decode(token: token)
      auth_token = AuthToken.find_by(id: jwt[:auth_token_id], expired_at: Time.current..)
      return if auth_token.nil?
      return if auth_token[:user_id] != auth_token.user_id

      auth_token.user
    end
  end
end
