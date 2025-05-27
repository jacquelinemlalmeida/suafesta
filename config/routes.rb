Rails.application.routes.draw do
  resources :participants, only: [:new, :create]
  get "/relatorio", to: "participants#relatorio"

  root to: "participants#new"
end
