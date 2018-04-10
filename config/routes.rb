Rails.application.routes.draw do
  root to: 'products#index'
  resources :products
  resources :categories

  get  '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
