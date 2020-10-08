Rails.application.routes.draw do

  root to: 'welcome#index'
  post "/login", to: "sessions#create"
  # get "/dashboard", to: "dashboard#index"
  resources :dashboard, only: :index
  resources :discover, only: :index
end
