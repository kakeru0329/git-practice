Rails.application.routes.draw do
  devise_for :customers


  root to: 'public/homes#top'
  get "homes/about" => "homes#about", as: "about"

  namespace :public do
    resources :addresses, only: [:index, :edit]
    resources :orders, only: [:new, :index, :show]
    resources :cart_items, only: [:index]
    resources :customers, only: [:edit]
    resources :sessions, only: [:new]
    resources :registrations, only: [:new]
    resources :items, only: [:index, :show]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit]
    resources :genres, only: [:index, :edit]
    resources :items, only: [:index, :new, :show, :edit]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
