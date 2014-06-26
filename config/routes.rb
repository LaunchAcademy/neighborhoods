Rails.application.routes.draw do

  root 'neighborhoods#index'
  devise_for :users
  devise_for :installs

  resources :neighborhoods, only: [:index, :new, :create, :show]
end
