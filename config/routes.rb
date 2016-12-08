Rails.application.routes.draw do
  root to: "products#index"

  devise_for :users, controllers: { registrations: 'registrations' }
  
  resources :products
  
  namespace :admin do
    resources :users
    root to: "users#index"
  end
end