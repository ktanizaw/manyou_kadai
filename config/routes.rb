Rails.application.routes.draw do
  get 'sessions/new'
  root to: 'tasks#index'
  resources :labels
  resources :tasks
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users
  end
end
