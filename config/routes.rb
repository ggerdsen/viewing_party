Rails.application.routes.draw do

  root to: 'welcome#index'
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :dashboard, only: :index
  resources :discover, only: :index
  resources :movies, only: [:index, :show]

  get "/register", to: "users#new"
  post "/register", to: "users#create"

  post "/friendships", to: "friendships#create"
end
