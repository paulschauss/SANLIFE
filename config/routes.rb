Rails.application.routes.draw do
  get 'foods/index'
  get 'user_illnesses/new'
  get 'user_illnesses/create'
  get 'users/show'
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :user_illnesses, only: [:new, :create]
  resources :foods, only: [:index]
end
