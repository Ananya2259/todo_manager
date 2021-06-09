Rails.application.routes.draw do
  post "users/login", to: "users#login" #As no resource is available for this rails convention wont work so it is created separately.
  #works on rails convention.
  get "/" => "home#index"
  resources :todos
  resources :users
end
