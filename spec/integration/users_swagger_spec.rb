require 'swagger_helper'

RSpec.describe 'CurConv - Users API', type: :request, swagger_doc: 'v1/swagger.yaml' do
  path '/users' do
    post 'Register a new user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string },
              email: { type: :string },
              password: { type: :string }
            },
            required: [ 'name', 'email', 'password' ]
          }
        },
        required: [ 'user' ]
      }

      response '201', 'User registered.' do
        run_test!
      end

      response '422', 'Invalid input.' do
        run_test!
      end
    end
  end

  path '/login' do
    post 'User login' do
      tags 'Sessions'
      consumes 'application/json'
      parameter name: :credentials, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'email', 'password' ]
      }

      response '200', 'login successful' do
        run_test!
      end

      response '401', 'invalid credentials' do
        run_test!
      end
    end
  end
end
