Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :hugs do
    resources :bookings, only: [ :index, :new, :create ]
    resources :reviews, only: [ :index, :new, :show, :create, :destroy ]
  end
  resources :bookings, only: [:destroy]
end
