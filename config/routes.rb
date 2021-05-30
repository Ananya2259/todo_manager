Rails.application.routes.draw do
  post "users/login", to: "users#login"
  resources :todos
  resources :users
end
