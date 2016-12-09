Rails.application.routes.draw do
  root to: "products#index"

  devise_for :users, controllers: { registrations: 'registrations' }
  
  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_lines, only: [:create, :update, :destroy]
  resources :orders, only: [:index]
  resources :charges, only: [:new, :create]
  
  namespace :admin do
    resources :products
    root to: "products#index"
  end

  namespace :stripe_webhooks do
    post :charge_failed
    post :charge_succeeded
  end

end