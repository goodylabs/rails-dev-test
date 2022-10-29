Rails.application.routes.draw do
  devise_for :users
  get 'cart', to: 'cart#show', as: 'show_cart'
  post 'cart/add'
  post 'cart/remove'
  root 'home#index'
  get 'home/add', as: 'product_new', to: 'home#add'
  post 'home/add', to: 'home#create'
end
