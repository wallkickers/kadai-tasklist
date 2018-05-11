Rails.application.routes.draw do
  get 'taskposts/create'

  get 'taskposts/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'toppages/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: "tasks#index"
  
  #トップページ
  root to: "toppages#index"
  
  #ログイン認証機能
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  #会員登録
  resources :users
  get "signup",to: "users#new"
  
  #タスク登録
  resources :tasks
  
  #タスク管理
  resources :taskposts, only: [:create,:destroy,:update,:edit,:show]
  
end
