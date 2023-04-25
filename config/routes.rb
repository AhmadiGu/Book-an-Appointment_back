Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

#   namespace :api do
#     namespace :v1 do

#       resources :cars, only: [:show]
#       resources :reservations, only: [:index, :show, :create]
#   end
#  end

mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  use_doorkeeper
  devise_for :users


  draw :api
end