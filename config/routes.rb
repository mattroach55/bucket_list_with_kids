Rails.application.routes.draw do
  # LANDING PAGE
  root to: 'destinations#index'

  # BUCKETLIST PAGE
  get '/bucketlist', to: 'users#bucketlist', as: :bucketlist

  # PROFILE PAGE (DASHBOARD STYLE)
  get '/profile', to: 'users#profile', as: :profile

  # RESOURCES
  devise_for :users

  resource :user, only: [:edit] do
  collection do
    patch 'update_password'
  end
end

  resources :destinations do
    member do
      put :bucket_count, to: 'destinations#upvote'
    end
    resources :experiences, only: [:new, :create]
    resources :accommodations, only: [:new, :create]
    resources :photos, only: [:index, :show, :edit, :destroy, :update]
  end
  resources :experiences, only: [:index, :show, :edit, :destroy, :update] do
   resources :reviews, only: [:new, :create]
   resources :photos, only: [:index, :show, :edit, :destroy, :update]
 end
  resources :accommodations, only: [:index, :show, :edit, :destroy, :update] do
   resources :reviews, only: [:create]
   resources :photos, only: [:index, :show, :edit, :destroy, :update]
 end
  resources :reviews, only: [:destroy]
end
