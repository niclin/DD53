require 'subdomain'

Rails.application.routes.draw do

  get 'errors/not_found'

  get 'errors/internal_server_error'

  as :user do
    patch '/user/confirmation' => 'user/confirmations#update', :via => :patch, :as => :update_user_confirmation
  end
  devise_for :users, :controllers => { :confirmations => "user/confirmations", registrations: 'user/registrations', :invitations => 'user/invitations' }

  get "/signin" => "pages#signin"
  post "/switch_domain" => "pages#switch_domain"


  constraints(Subdomain) do
    get '/' => 'events#index'
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
      match 'user/invite', to: 'users#invite', as: :invite, via: [:get, :post]
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
      match 'cancel_order/:order_id', to: 'events#cancel_order', as: :cancel_order, via: [:post]
      match 'food/:food_id/add_to_cart', to: 'events#add_to_cart', as: :add_to_cart, via: [:get, :post]
      match 'food/:food_id/:sub_id/add_multi_to_cart', to: 'events#add_multi_to_cart', as: :add_multi_to_cart, via: [:get, :post]
    end


    resources :menus
    resources :orders
  end

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  # redirect all unknown routes to root_url
  get '*path' => redirect('/')

  root 'pages#welcome'

end
