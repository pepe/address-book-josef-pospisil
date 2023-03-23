Rails.application.routes.draw do
  get "/", to: "people#index"
  resources :people do
    resources :addresses, shallow: true
    resources :emails, shallow: true
    resources :phones, shallow: true
  end 
end