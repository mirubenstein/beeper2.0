Rails.application.routes.draw do
  root to: 'beeps#index'

  resources :users, only: [:show]
  resources :beeps
  devise_for :users
end
