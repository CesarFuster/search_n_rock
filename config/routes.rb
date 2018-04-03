Rails.application.routes.draw do

  devise_for :users

  resources :instruments do
    resources :rents, only: [:index, :show, :new, :create]
  end

  root to: 'pages#home'
end


