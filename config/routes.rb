Rails.application.routes.draw do
  # LANDING PAGE
  root to: 'destinations#index'
  get '/bucketlist', to: 'users#bucketlist', as: :bucketlist

  # RESOURCES
  devise_for :users

  resources :destinations do
    resources :experiences, only: [:create]
    resources :accomodations, only: [:create]
  end
  resources :experiences, only: [:index, :show, :edit, :destroy] do
   resources :reviews, only: [:create]
 end
  resources :accomondations, only: [:index, :show, :edit, :destroy] do
   resources :reviews, only: [:create]
 end
  resources :reviews, only: [:destroy]
end
