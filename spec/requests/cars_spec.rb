require 'swagger_helper'

RSpec.describe 'cars', type: :request do
  path '/api/v1/cars' do
    get 'Retrieves all cars' do
      tags 'Cars'
      produces 'application/json'

      response '200', 'cars found' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 description: { type: :string },
                 photo: { type: :string },
                 car_model: { type: :string },
                 price_per_day: { type: :integer },
                 user_id: { type: :integer }
               },
               required: %w[name description photo car_model price_per_day user_id]

        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end

  path '/api/v1/cars' do
    post 'Creates a car' do
      tags 'Cars'
      consumes 'application/json'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          photo: { type: :string },
          car_model: { type: :string },
          price_per_day: { type: :integer },
          user_id: { type: :integer }
        },
        required: %w[name description photo car_model price_per_day user_id]
      }

      response '201', 'car created' do
        let(:car) do
          { name: 'Tesla', description: 'An electric car', photo: 'tesla.jpg', car_model: 'S', price_per_day: 50,
            user_id: 1 }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:car) { { name: 'tesla' } }
        run_test!
      end
    end
  end

  path '/api/v1/cars/{id}' do
    get 'Retrieves a car' do
      tags 'Cars'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      request_body_example value: { id: '1' }, name: 'basic', summary: 'Request example description'

      response '200', 'car found' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 description: { type: :string },
                 photo: { type: :string },
                 car_model: { type: :string },
                 price_per_day: { type: :integer },
                 user_id: { type: :integer }
               },
               required: %w[name description photo car_model price_per_day user_id]

        let(:id) do
          Car.create(name: 'Tesla', description: 'An electric car', photo: 'tesla.jpg', car_model: 'S',
                     price_per_day: 50, user_id: 1).id
        end
        run_test!
      end

      response '404', 'car not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end

  path '/api/v1/cars/{id}' do
    delete 'Deletes a car' do
      tags 'Cars'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      request_body_example value: { id: '1' }, name: 'basic', summary: 'Request example description'

      response '200', 'car deleted' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 description: { type: :string },
                 photo: { type: :string },
                 car_model: { type: :string },
                 price_per_day: { type: :integer },
                 user_id: { type: :integer }
               },
               required: %w[name description photo car_model price_per_day user_id]


        let(:id) do
          Car.create(name: 'Tesla', description: 'An electric car', photo: 'tesla.jpg', car_model: 'S',
                     price_per_day: 50, user_id: 1).id
        end
        run_test!
      end

      response '404', 'car not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end
end
