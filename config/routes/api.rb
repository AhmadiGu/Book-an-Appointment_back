namespace :api do
    namespace :v1 do
      scope :users, module: :users do
        post '/', to: 'registrations#create', as: :user_registration
      end
      get '/users/me', to: 'users#me'
      post '/cars', to: 'cars#index', as: :cars
      post 'cars', to: 'cars#create'
      delete 'cars', to: 'cars#destroy'
      get 'cars/(:id)', to: 'cars#show'
      get '/reservations', to: 'reservations#index'
      post 'reservations/(:id)', to: 'reservations#show'
      post 'cars/(:id)/reservations', to: 'reservations#create'
    end
  end

  scope :api do
    scope :v1 do
      use_doorkeeper do
        skip_controllers :authorizations, :applications, :authorized_applications
      end
    end
  end