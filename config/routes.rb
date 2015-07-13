Rails.application.routes.draw do
  resources :listings
  resources :listings, except: [:index]
  resources :categories, only: [:show]
  resources :subcategories, only: [:show]
  resources :forums, only: [:show]
    # resources :conversations, only: [:index, :show, :destroy]
  resources :messages, only: [:new, :create]
  resources :users, only: [:index]

  # root 'listings#index'
  get 'tags/:tag', to: 'listings#index', as: :tag
  get 'static_pages/update_subcategories', :as => 'update_subcategories'
  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users do
    member do
      get :listings
      get :following, :followers
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
