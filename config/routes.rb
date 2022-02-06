Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  
  resource :cart_items, only: [:create]
  
  root 'products#index'
  
end
