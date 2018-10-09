Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :events do
    resources :registrations, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end
