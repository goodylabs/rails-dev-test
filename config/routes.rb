Rails.application.routes.draw do
  
  ActiveAdmin.routes(self)
  
  resource :cart_items, only: [:create, :destroy]
  resource :carts, only: [:show]

  post '/checkout', to: 'checkouts#create', as: :create_checkout
  get '/checkout/(:step)', to: 'checkouts#edit', as: :checkout
  
  root 'products#index', as: :products
end
