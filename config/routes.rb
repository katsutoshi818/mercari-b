Rails.application.routes.draw do

  resources :card, only: [:new, :show, :index] do
    collection do
      post 'payjp', to: 'card#payjp'
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

  resources :products do
    collection do
      get :search
    end
  end
  resources :categories, only: [:index, :new, :show, :search] do
    collection do
      get :search
    end
  end
  
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
  resources :product_sizes, only: [:index, :new]
end