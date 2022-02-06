Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  
  resource :cart_items, only: [:create, :destroy]
  resource :carts, only: [:show]
  
  root 'products#index'
  
end
