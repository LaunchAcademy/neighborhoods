Rails.application.routes.draw do
  root 'neighborhoods#index'


  resources :neighborhoods, only: [:index, :new, :create, :show, :update] do
    resources :reviews, only: [:new, :create]
  end

  devise_for :users


  namespace :admin do
    resources :users, only: [:index, :update, :destroy, :edit]
  end

end
