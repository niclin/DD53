Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :menus
    resources :orders
    resources :users do
      member do
        post :to_admin
        post :to_normal
      end
    end
    match 'order/:menu_id/select', to: 'orders#order_select', as: :select, via: [:get, :post]
  end

  resources :menus
  resources :orders do
    match 'checkout', to: 'orders#checkout', as: :checkout, via: [:get]
    member do
      post :join_order
    end
  end

  root "menus#index"
end
