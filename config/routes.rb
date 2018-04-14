Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login' }
  root to: 'products#index'
  resources :products
  resources :categories
  resources :charges

  resources :orders do
    collection do
      get :open
    end

    collection do
      get :payment
    end

    member do
      put :ready
    end

    member do
      put :complete
    end
  end


  
  get  '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'
end
