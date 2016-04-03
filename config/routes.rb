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
  resources :orders

  root "menus#index"
end
