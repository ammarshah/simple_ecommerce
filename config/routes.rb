Rails.application.routes.draw do
  root to: "products#index"

  devise_for :users, controllers: { registrations: 'registrations' }
  
  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_lines, only: [:create, :update, :destroy]
  resources :orders, only: [:index]
  
  namespace :admin do
    resources :products
    root to: "products#index"
  end

end