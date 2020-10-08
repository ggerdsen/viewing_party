Rails.application.routes.draw do
  
  root to: 'welcome#index'
  post "/login", to: "sessions#create"
  get "/dashboard", to: "dashboard#index"
  get "/register", to: "users#new"
  post "/register", to: "users#create"
end
