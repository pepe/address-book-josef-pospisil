Rails.application.routes.draw do
  get "/", to: "people#index"
  resources :people do
    resources :addresses, shallow: true
    resources :emails, shallow: true
    resources :phones, shallow: true
  end
  
  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  post "/logout", to: "sessions#destroy"
  get "/signup", to: "user#new"
  post "/signup", to: "user#create"
end