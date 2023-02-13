Rails.application.routes.draw do
  get 'carts/show'
  root "products#index"
  resources :products
end
