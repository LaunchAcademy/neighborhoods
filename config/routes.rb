Rails.application.routes.draw do
  root 'neighborhoods#index'

  resources :neighborhoods, only: [:index, :new, :create, :show]
  devise_for :users
end
