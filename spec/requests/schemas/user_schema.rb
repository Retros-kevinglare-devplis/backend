module Requests::Schemas::UserSchemas
  RequestSignUp = {
      type: :object,
      properties: {
        email: { type: :string },
        password: { type: :string },
        firstName: { type: :string },
        lastName: { type: :string },
        username: { type: :string },
        fingerprint: { type: :string }
      },
      required: %w[email password firstName lastName username]
    }
end