Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :events
  resources :users, only: [:show]
end
