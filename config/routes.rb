Rails.application.routes.draw do
  
  ActiveAdmin.routes(self)
  
  resource :cart_items, only: [:create, :destroy]
  resource :carts, only: [:show]
  resource :orders, only: [:show]

  post '/checkout', to: 'checkouts#create', as: :create_checkout
  get '/checkout/(:step)', to: 'checkouts#edit', as: :checkout
  patch '/checkout/(:step)', to: 'checkouts#update', as: :checkout_update
  post '/checkout/make_payment', to: 'checkouts#make_payment', as: :make_payment

  
  root 'products#index', as: :products
end
