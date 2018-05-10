Rails.application.routes.draw do
  get 'taskposts/create'

  get 'taskposts/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'toppages/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: "tasks#index"
  
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  resources :users
  get "signup",to: "users#new"
  
  resources :tasks
  
  resources :taskposts, only: [:create,:destroy]
  
end
