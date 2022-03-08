Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :foods, only: [:index] do
    get :next, on: :collection
  end

  resources :users do
    member do
      get :illness
    end
  end

  post 'send_email', to: "send_emails#nutrient_email"
  get 'dashboard', to: "pages#dashboard"
  get 'preferences', to: "pages#preferences"

  resources :user_illnesses, only: [] do
    post :add, on: :member
    delete :remove, on: :member
  end

  resources :illness_nutrients, only: [:index]
end
