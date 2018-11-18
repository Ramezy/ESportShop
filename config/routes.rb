Rails.application.routes.draw do
  get 'product/index'
  get 'product/show'
  get 'pages/permalink'
  get 'pages/show'
  get 'pages/about'
  get 'home/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
