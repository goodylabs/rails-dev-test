Rails.application.routes.draw do
  get 'products/new'
  get 'products/create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'
  }

  resources :users, only: [] do
    resources :carts, only: [:show]  do
      resources :product_orders, only: [:destroy]
    end
    resources :orders do
      resources :product_orders, only: [:destroy]
    end
  end
  resources :products do
    resources :product_orders, only: [:destroy]
  end 

  authenticated :user do
    root to: redirect('/products'), as: :authenticated_user_root
  end
  unauthenticated :user do
    devise_scope :user do
      get '/' => 'devise/sessions#new'
    end
  end
end
