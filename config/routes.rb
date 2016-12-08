Rails.application.routes.draw do
  root to: "products#index"

  devise_for :users, controllers: { registrations: 'registrations' }
  
  resources :products, only: [:index]
  
  namespace :admin do
    resources :products
    root to: "products#index"
  end
end