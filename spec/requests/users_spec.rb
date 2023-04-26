require 'swagger_helper'

RSpec.describe 'users', type: :request do
  path '/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string },
          email: { type: :string }
        },
        required: %w[username password email]
      }

      response '201', 'user created' do
        let(:user) { { username: 'test', password: 'test123', email: 'test@test.com' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { username: 'test' } }
        run_test!
      end
    end
  end
end
