require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:application) { Doorkeeper::Application.create!(name: 'MyApp', redirect_uri: 'urn:ietf:wg:oauth:2.0:oob') }
  let(:access_token) do
    Doorkeeper::AccessToken.create(resource_owner_id: user.id, application_id: application.id).token
  end

  describe 'GET #index' do
    before do
      @car1 = FactoryBot.create(:car)
      @car2 = FactoryBot.create(:car)
      get '/api/v1/cars', headers: {
        Authorization: "Bearer #{access_token}"
      }
    end

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all cars' do
      expect(assigns(:cars)).to match_array([@car1, @car2])
    end

    it 'returns cars in JSON format' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        {
          name: 'Honda Civic',
          photo: 'https://images.clickdealer.co.uk/vehicles/4759/4759877/full/108663623.jpg',
          description: 'Compact car',
          price_per_day: 120,
          car_model: 'Civic 2022',
          user_id: user1.id
        }
      end

      it 'creates a new car' do
        expect do
          post '/api/v1/cars', params: { car: valid_attributes }, headers: {
            Authorization: "Bearer #{access_token}"
          }
        end.to change(Car, :count).by(1)
      end

      it 'renders a JSON response with the new car' do
        post '/api/v1/cars', params: { car: valid_attributes }, headers: {
          Authorization: "Bearer #{access_token}"
        }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.content_type).to match(%r{^application/json})
        expect(response.body).to include(valid_attributes[:name])
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) do
        {
          name: '',
          description: '',
          photo: '',
          car_model: '',
          price_per_day: '',
          user_id: ''
        }
      end

      it 'does not create a new car' do
        expect do
          post '/api/v1/cars', params: { car: invalid_attributes }, headers: {
            Authorization: "Bearer #{access_token}"
          }
        end.to_not change(Car, :count)
      end

      it 'renders a JSON response with errors for the new car' do
        post '/api/v1/cars', params: { car: invalid_attributes }, headers: {
          Authorization: "Bearer #{access_token}"
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.content_type).to match(%r{^application/json})
        expect(response.body).to include("Name can't be blank")
        expect(response.body).to include('Description is too short (minimum is 3 characters)')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when authorized' do
      let(:car) { FactoryBot.create(:car) }

      before do
        delete "/api/v1/cars/#{car.id}", headers: {
          Authorization: "Bearer #{access_token}"
        }
      end

      it 'deletes the car' do
        expect(Car.exists?(car.id)).to be_falsey
      end
      it 'returns a success response' do
        expect(response).to have_http_status(:success)
      end

      it 'returns a JSON response with a success message' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.body).to include('Car deleted')
      end
    end
  end
end
