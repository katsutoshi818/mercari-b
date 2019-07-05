Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new, :show, :edit, :update]
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
end