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
  end
end
