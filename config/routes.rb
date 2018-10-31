Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :events do
    collection do
      get 'search'
    end
    member do
      get 'test1'
    end
    resources :registrations, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end
