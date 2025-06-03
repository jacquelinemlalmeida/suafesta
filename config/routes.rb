Rails.application.routes.draw do

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
  resources :parties

  #dashboard
  get "/dashboard", to: "dashboard#index"

  root to: "sessions#new"
end
