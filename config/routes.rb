Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :instruments do
    resources :rents, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :rents, only: [:index, :show]

  root to: 'pages#home'
  get 'profile', to: 'pages#profile'

end

