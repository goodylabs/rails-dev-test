Rails.application.routes.draw do
  get 'carts/show'
  root "products#index"
  resources :products
  resources :orders, only: [:index, :show, :new]
end
