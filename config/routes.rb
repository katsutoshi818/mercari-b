Rails.application.routes.draw do

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/thanks' => 'users/registrations#thanks'
  end

  root 'products#index'
  resources :products
  resources :categories, only: [:index]
  resources :users, only: [:show, :new] do
    collection do
      get :profile
      get :logout
      get :identification
      get :deliver_address
      get :card
      get :email
      get :password
    end
  end
  resources :product_sizes, only: :index
end