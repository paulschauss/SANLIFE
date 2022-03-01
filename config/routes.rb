Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
   }

  root to: 'pages#home'

  resources :users, only: [:show]
  resources :user_illnesses, only: %i[new create]
  resources :foods, only: [:index]
  resources :users do
    member do
      get :illness
    end
  end
end
