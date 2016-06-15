Rails.application.routes.draw do
  devise_for :users

  namespace :account do
    resources :orders
  end

  namespace :admin do
    resources :menus
    resources :events do
      post :invoice
    end
    resources :orders
    resources :users do
      member do
        post :to_admin
        post :to_normal
      end
    end
    match 'event/select', to: 'events#select', as: :select, via: [:get, :post]
    match 'event/select/:menu_id', to: 'events#select_menu', as: :select_menu, via: [:get, :post]
  end

  resources :carts do
    collection do
      post :checkout
      delete :clean
    end
  end

  resources :items, controller: "cart_items"
  resources :events do
    member do
      post :join_event
      get :ordering
      get :reference
      post :to_abandon
    end
    match 'food/:food_id/add_to_cart', to: 'events#add_to_cart', as: :add_to_cart, via: [:get, :post]
    match 'food/:food_id/:sub_id/add_multi_to_cart', to: 'events#add_multi_to_cart', as: :add_multi_to_cart, via: [:get, :post]
  end


  resources :menus
  resources :orders
  root "events#index"
end
