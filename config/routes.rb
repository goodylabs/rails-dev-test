Rails.application.routes.draw do
  get 'cart/show'
  root 'home#index'
  get 'home/add', as: 'product_new'
  post 'home/add', to: 'home#create'
end
