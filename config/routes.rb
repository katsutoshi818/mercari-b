Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new, :show, :edit, :update, :create]
  resources :categories, only: [:index]
  resources :users, only: [:index, :new] do
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