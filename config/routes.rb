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
      put :bucket_count_down, to: 'destinations#downvote'
    end
    resources :experiences, only: [:new, :create]
    resources :accommodations, only: [:new, :create]
    resources :photos, only: [:index, :show, :edit, :destroy, :update]
  end

  resources :experiences, only: [:index, :show, :edit, :destroy, :update] do
    member do
      put :bucket_count, to: 'experiences#upvote'
    end
   resources :reviews, only: [:new, :create]
   resources :photos, only: [:index, :show, :edit, :destroy, :update]
  end

  resources :accommodations, only: [:index, :show, :edit, :destroy, :update] do
    member do
      put :bucket_count, to: 'accommodations#upvote'
    end
   resources :reviews, only: [:create]
   resources :photos, only: [:index, :show, :edit, :destroy, :update]
  end

  resources :photos, only: [:destroy]
  resources :reviews, only: [:destroy]

  get '/:destination_name', to: 'destinations#show_by_name', as: :destination_by_name
  get '/:destination_name/:experience_name', to: 'experiences#show_by_name', as: :experience_by_name
end
