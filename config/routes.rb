Rails.application.routes.draw do
    # 顧客用
    # URL /customers/sign_in ...
    devise_for :customers,skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

    # 管理者用
    # URL /admin/sign_in ...
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
      sessions: "admin/sessions"
    }
  namespace :admin do

    root to: "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    root to: 'homes#top'
    get "/about" => "homes#about", as: "about"
    resources :addresses, only: [:index, :edit, :update, :create, :destroy]
    get '/orders/conplete' => 'orders#conplete', as: 'order_conplete'
    resources :orders, only: [:new, :index, :show, :create]
    post '/orders/confirm' => 'orders#confirm', as: 'order_confirm'

    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: "cart_all_destroy"
    resources :cart_items, only: [:index, :update, :destroy, :create]
    get'/customers/information/edit' => 'customers#edit', as: 'customer_edit'
    get'/customers/show' => 'customers#show', as: 'customer_show'
    patch'/customers/information' => 'customers#update', as: 'customer_update'

    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
    patch '/customers/withdraw' => 'customerswithdraw', as: 'customer_withdraw'

    resources :items, only: [:index, :show]

  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
