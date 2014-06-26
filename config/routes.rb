Rails.application.routes.draw do
  root 'neighborhoods#index'

  resources :neighborhoods, only: [:index, :new, :create, :show] do
    resource :reviews, only: [:index, :new, :create, :show]
  end
  devise_for :users
end
