Rails.application.routes.draw do
  devise_for :users
  get 'cart', to: 'cart#show', as: 'show_cart'
  #add to cart
  post 'cart/add'
  #remove from cart
  post 'cart/remove'
  #home page with products
  root 'home#index'
  #product add
  get 'home/add', as: 'product_new', to: 'home#add'
  post 'home/add', to: 'home#create'
  #show product
  get 'home/:id', to: 'home#show', as: 'product_show'
end
