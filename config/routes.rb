Rails.application.routes.draw do
  get 'welcomes/index'
  root to: 'welcomes#index'

  get 'welcomes/about'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', :registrations => "users/registrations" }
  # devise_for :users, :controllers => {:registrations => "users/registrations"}
end

