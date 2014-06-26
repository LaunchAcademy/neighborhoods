Rails.application.routes.draw do
  root 'neighborhoods#index'

  devise_for :users
end
