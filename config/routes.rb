Rails.application.routes.draw do

  devise_for :users

  resources :instruments do
    resources :rents, only: [:new, :create]
  end

  resources :rents, only: [:index, :show]

  root to: 'pages#home'
end


