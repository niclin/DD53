Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :menus
    resources :events
    resources :users do
      member do
        post :to_admin
        post :to_normal
      end
    end
    match 'event/:menu_id/select', to: 'events#select_menu', as: :select, via: [:get, :post]
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
    end
    match 'food/:food_id/add_to_cart', to: 'events#add_to_cart', as: :add_to_cart, via: [:get, :post]
  end


  resources :menus
  resources :orders
  root "events#index"
end
