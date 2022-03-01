Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :user_illnesses, only: [:new, :create]
  resources :foods, only: [:index]
  resources :illnesses_nutrients, only: [:new, :create]
end
