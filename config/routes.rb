Rails.application.routes.draw do
  resources :sessions
  resources :votes, only: [:new, :create]
  resources :categories, only: [:index]
  resources :ballots, only: [:show, :new, :create]

  get "login", to: "sessions#new"
  get "logout", to: "sessions#destroy"

  root "sessions#new"
end
