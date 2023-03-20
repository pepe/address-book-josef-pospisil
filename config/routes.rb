Rails.application.routes.draw do
  resources :people do
    resources :addresses, shallow: true
    resources :emails, shallow: true
  end 
end
