Rails.application.routes.draw do
  get 'pages/permalink'
  get 'pages/show'
  get 'pages/about'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :search, only:[:index] do
    collection do
      get 'results'
    end
  end

  resources :category , only:[:index] do
    collection do
      get 'results'
    end
  end

  resources :filter, only:[:index] do
    collection do
      get 'results'
    end
  end

  resources :product, only: [:index, :show]
  resources :home, only:[:index]
  root to: 'product#index'

  
end
