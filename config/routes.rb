Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :foods, only: [:index]

  resources :users do
    member do
      get :illness
    end
  end

  get 'dashboard', to: "pages#dashboard"
  get 'preferences', to: "pages#preferences"

  resources :illnesses, only: [] do
    post :add, on: :member
    delete :remove, on: :member
  #   resources :user_illnesses, only: %i[add remove]
  end
end
