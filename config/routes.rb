Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: "homes#about"
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  post 'books/:id', to: "books#create"
  
  resources :users, only: [:index, :show, :edit, :update]
  post 'users/index', to: 'books#create'
  post 'users/:id', to: "books#create"
  
end

