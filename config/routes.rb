Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'map', to: "pages#map"
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  resources :organisations do
    resources :experiences, only: [ :new, :create, :edit, :update, :destroy]
  end

  resources :experiences, only: [:index, :show]

  resources :experiences, only: [:show] do
    resources :orders, only: [:index, :show, :create]
  end

  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: :new
  end
  resources :orders do
    resources :reviews, only: [ :new, :create, :edit, :update, :destroy ]
  end
end

