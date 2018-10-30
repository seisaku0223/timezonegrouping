Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :events do
    collection do
      get 'search'
    end
    resources :registrations, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end
