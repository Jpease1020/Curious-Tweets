Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/twitter', as: :login
  get "/auth/twitter/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "logout"


  get "dashboard", to: "dashboard#index"
  get "profile", to: "users#show", as: "profile"
  
  resources :tweets, only: [:create, :edit, :update, :destroy]
  resources :favorites, only: [:create, :destroy]
end
