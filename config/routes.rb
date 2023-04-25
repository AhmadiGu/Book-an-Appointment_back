Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :cars, only: [:index,:show,:destroy]
      
      resources :cars, only: [:show]
      resources :reservations, only: [:index, :show, :create]
  end
 end
end