Rails.application.routes.draw do
  root 'neighborhoods#index'

  resources :reviews, only: [] do
      resources :votes, only: [:create, :update, :destroy]
    end

  resources :neighborhoods, only: [:index, :new, :create, :show, :update] do
    resources :reviews, only: [:new, :create]
  end

  devise_for :users
end
