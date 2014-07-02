Rails.application.routes.draw do
  root 'neighborhoods#index'


  resources :reviews, only: [] do
      resources :votes, only: [:create, :update, :destroy]
  end

  resources :neighborhoods, only: [:index, :new, :create, :show, :update, :search] do
    resources :reviews, only: [:new, :create]
  end

  devise_for :users


  namespace :admin do
    resources :users, only: [:index, :update, :destroy, :edit]
  end

  namespace :admin do
    resources :neighborhoods, only: [:index, :update, :destroy]
  end

end
