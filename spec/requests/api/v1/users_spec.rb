require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do

  path '/api/v1/users/sign_up' do

    post('sign_up user') do
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, schema: RequestSignUp

      response '200', 'user registered' do
        let(:user) {
          {
            email: Faker::Internet.email,
            password: Faker::Internet.password,
            firstName: Faker::Name.first_name,
            lastName: Faker::Name.last_name,
            username: Faker::Internet.username,
            fingerprint: SecureRandom.hex
          }
        }

        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 content: { type: :string }
               },
               required: %i[id title]
        run_test!
      end

      response '422', 'user registered' do
        let(:user) { { fingerprint: 'test'  } }
        run_test!
      end
    end
  end

  after do |example|
    example.metadata[:response][:content] = {
      'application/json' => {
        example: JSON.parse(response.body, symbolize_names: true)
      }
    }
  end
  #
  # path '/v1/users/sign_in' do
  #
  #   post('sign_in user') do
  #     response(200, 'successful') do
  #
  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end
  #
  # path '/v1/users/refresh' do
  #
  #   post('refresh user') do
  #     response(200, 'successful') do
  #
  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end
  #
  # path '/v1/users/whoami' do
  #
  #   get('whoami user') do
  #     response(200, 'successful') do
  #
  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end
end
