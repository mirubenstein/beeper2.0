Rails.application.routes.draw do
  root to: 'beeps#index'

  resources :beeps
  devise_for :users
  resources :users, only: [:show]
end
