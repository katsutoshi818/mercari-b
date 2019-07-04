Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
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