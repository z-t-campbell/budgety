Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :organisations do
    resources :experiences, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :experiences, only: [:show, :index]
end
