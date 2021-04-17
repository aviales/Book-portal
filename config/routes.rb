Rails.application.routes.draw do
  devise_for :users
  resources :books
  post 'books/:id', to: "books#status", as: "status"
  put 'users/:id', to: "users#status0", as: "status0"
  root 'books#index'
  get 'users/:id', to: "users#profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
