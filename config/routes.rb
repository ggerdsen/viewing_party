Rails.application.routes.draw do

  root to: 'welcome#index'
  post "/login", to: "sessions#create"

  resources :dashboard, only: :index
  resources :discover, only: :index
  resources :movies, only: :index

  get "/register", to: "users#new"
  post "/register", to: "users#create"
  
end
