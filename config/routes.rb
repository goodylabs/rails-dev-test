Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'
  }

  resources :users, only: [] do
    resources :carts, only: [:show] do
      resources :product_orders, only: [:destroy]
    end
    resources :orders, only: [:create, :index] do
      resources :product_orders, only: []
    end
  end
  resources :products, only: [:index] do
    resources :product_orders, only: [:create]
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
