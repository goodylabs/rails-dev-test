Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#index'

  get 'basket', :to => 'order#basket', :as => 'basket'
  get 'basket/checkout', :to => 'order#checkout', :as => 'checkout'
end
