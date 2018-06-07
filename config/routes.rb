Rails.application.routes.draw do
  # LANDING PAGE
  root to: 'pages#home'

  get 'search', to: 'pages#search'

  # BUCKETLIST PAGE
  get '/bucketlist', to: 'users#bucketlist', as: :bucketlist

  # get '/destinations/:destination_id', to: 'destinations#show_redirect'

  # PROFILE PAGE (DASHBOARD STYLE)
  get '/profile', to: 'users#profile', as: :profile

  # Content management pages
  get '/manage', to: 'management#index', as: :manage_content
  get '/manage/destinations', to: 'management#destinations', as: :manage_destinations
  get '/manage/experiences/:destination_id', to: 'management#destination_experiences', as: :manage_destination_experiences

  # RESOURCES
  devise_for :users

  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end

  resources :accommodations
  resources :photos, only: [:destroy]
  resources :reviews, only: [:destroy]

  resources :destinations, only: [:index, :create]
  resources :destinations, path: '', except: [:index, :create] do
    member do
      put :bucket_count, to: 'destinations#upvote'
      put :bucket_count_down, to: 'destinations#downvote'
    end
    resources :experiences, only: [:new, :create]
    resources :accommodations, only: [:new, :create]
    resources :photos, only: [:index, :show, :edit, :destroy, :update]
  end
 
  resources :experiences, only: [:index]
  resources :experiences, path: ':destination_id', only: [:show, :edit, :destroy, :update] do
    member do
      put :bucket_count, to: 'experiences#upvote'
    end
   resources :reviews, only: [:new, :create]
   resources :photos, only: [:index, :show, :edit, :destroy, :update]
  end
end
