Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new, :show, :edit, :update, :create]
  resources :users, only: [:index] do
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