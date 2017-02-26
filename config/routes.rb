Rails.application.routes.draw do
  resources :sessions
  resources :votes, only: [:create]
  resources :categories, only: [:index]
  resource :ballot, only: [:show, :new, :create]

  get "login", to: "sessions#new"
  get "logout", to: "sessions#destroy"

  root "sessions#new"
end
