Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :users, only: [:index]
  get 'users/profiles' => 'profiles#index'
end