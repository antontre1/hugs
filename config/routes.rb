Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :hugs do
    resources :bookings, only: [ :index, :new, :create, :destroy ]
    resources :reviews, only: [ :index, :new, :show, :create, :destroy ]
  end
  delete '/booking/ajax/:id', to: 'bookings#destroy_ajax'
  resources :bookings, only: [:destroy]
  get "my_bookings", to: "bookings#index_user", as: :index_user
  resources :users, only: :show
end
