Rails.application.routes.draw do
  root 'neighborhoods#index'
  devise_for :users

  namespace :admin do
    resources :users, only: [:index, :update, :destroy, :edit]
  end
end
