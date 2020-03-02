Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  resources :organisations do
    resources :experiences, only: [ :new, :create, :edit, :update, :destroy]
  end
  resources :experiences, only: [:index, :show]

  resources :experiences, only: [:show] do
    resources :orders, only: [:show, :create]
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
end

