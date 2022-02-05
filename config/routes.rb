Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'products#index'
end
