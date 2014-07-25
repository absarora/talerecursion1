Rails.application.routes.draw do
  get 'welcomes/index'
  root to: 'welcomes#index'

  get 'welcomes/about'
  devise_for :users
end

