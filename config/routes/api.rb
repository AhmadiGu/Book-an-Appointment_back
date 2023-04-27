namespace :api do
  namespace :v1 do
    scope :users, module: :users do
      post '/', to: 'registrations#create', as: :user_registration
    end

    get '/users/me', to: 'users#me'

    resources :cars, only: [:index, :create, :destroy, :show]

    resources :reservations, only: [:index, :create, :show]
    post 'cars/:id/reservations', to: 'reservations#create'

    post '/oauth/token/info', to: 'oauth#token_info'
  end
end

scope :api do
  scope :v1 do
    use_doorkeeper do
      skip_controllers :authorizations, :applications, :authorized_applications
    end
  end
end
