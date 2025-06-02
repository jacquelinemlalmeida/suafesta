Rails.application.routes.draw do

 # Session
  resources :sessions, only: [:create, :destroy]
  get "/login", to: "sessions#new", as: :login
  delete "/logout", to: "sessions#destroy", as: :logout

  # Participantes
  resources :participants do
    resources :guests
  end
  get "/relatorio", to: "participants#relatorio"

  # Usuários
  resources :users, only: [:new, :create]

  root to: "sessions#new"
end
