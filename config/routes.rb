Rails.application.routes.draw do
  # LANDING PAGE
  root to: 'destinations#index'

  # BUCKETLIST PAGE
  get '/bucketlist', to: 'users#bucketlist', as: :bucketlist

  # PROFILE PAGE (DASHBOARD STYLE)
  get '/dashboard', to: "users#dashboard", as: :dashboard

  # RESOURCES
  devise_for :users

  resources :destinations do
    resources :experiences, only: [:new, :create]
    resources :accommodations, only: [:new, :create]
  end
  resources :experiences, only: [:index, :show, :edit, :destroy] do
   resources :reviews, only: [:create]
 end
  resources :accommodations, only: [:index, :show, :edit, :destroy] do
   resources :reviews, only: [:create]
 end
  resources :reviews, only: [:destroy]
end
