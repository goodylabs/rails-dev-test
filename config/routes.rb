Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root "products#index"

  resources :carts, only: [:show, :destroy]
  resources :line_items, only: [:create, :show, :destroy] do
    member do
      post :add_quantity
      post :reduce_quantity
    end
  end

  resources :products
  resources :orders, only: [:index, :show, :new, :create]
end
