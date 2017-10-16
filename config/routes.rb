Rails.application.routes.draw do
  resources :themes
  # resources :themes
  # get 'pages/home'

  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :users, only: [:show]

  resources :events do
    resources :bookings, only: [:create, :post]
  end

  resources :profiles, only: [:new, :edit, :create, :update]
  resources :photos

  namespace :api do
    resources :events
  end

end
