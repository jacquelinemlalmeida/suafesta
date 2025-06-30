require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'

 # Session
  resources :sessions, only: [:create, :destroy]
  get "/login", to: "sessions#new", as: :login
  get "/logout", to: "sessions#destroy", as: :logout

  # Participantes
  resources :participants do
    resources :guests
  end
  get "/relatorio", to: "participants#relatorio"

  # Usuários
  resources :users, only: [:new, :create]

  # Festas
  resources :parties do
    member do
      get :relatorio
    end
  end

  #dashboard
  get "/dashboard", to: "dashboard#index"

  root to: "sessions#new"

  get 'party/:id/public/:url_ending', to: 'participants#new', as: :party_form
  post 'party/:id/public/:url_ending', to: 'participants#create'
end
