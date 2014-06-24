Rails.application.routes.draw do

  devise_for :users
  devise_for :installs
  root 'neighborhoods#index'

end
