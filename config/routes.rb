Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products
  resources :categories

  get  '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'
end
