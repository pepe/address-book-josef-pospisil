Rails.application.routes.draw do
  resources :people do
    resources :addresses, shallow: true
  end 
end
