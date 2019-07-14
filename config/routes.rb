Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/thanks' => 'users/registrations#thanks'
  end

  root 'products#index'
  resources :products, only: [:index, :new, :show, :edit, :update, :create]
  resources :categories
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