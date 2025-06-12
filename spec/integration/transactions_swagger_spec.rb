require 'swagger_helper'

RSpec.describe 'CurConv - Transactions API', type: :request, swagger_doc: 'v1/swagger.yaml' do
  path '/transactions' do
    get 'List transactions' do
      tags 'Transactions'
      produces 'application/json'
      parameter name: :user_id, in: :query, type: :integer, description: 'User ID (optional)'

      response '200', 'transactions listed' do
        schema type: :array, items: {
          type: :object,
          properties: {
            id: { type: :integer },
            user_id: { type: :integer },
            from_cur: { type: :string },
            to_cur: { type: :string },
            from_val: { type: :number },
            to_val: { type: :number },
            rate: { type: :number },
            timestamp: { type: :string, format: :date_time }
          }
        }
        run_test!
      end
    end
  end

  path '/transactions/convert' do
    post 'Convert currency and create transaction' do
      tags 'Transactions'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :body, in: :body, schema: {
        type: :object,
        properties: {
          from_cur: { type: :string },
          to_cur: { type: :string },
          from_val: { type: :number }
        },
        required: [ 'from_cur', 'to_cur', 'from_val' ]
      }

      response '201', 'Transaction created.' do
        run_test!
      end

      response '401', 'Unauthorized.' do
        run_test!
      end
    end
  end
end
