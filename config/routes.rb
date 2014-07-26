Rails.application.routes.draw do
  get 'welcomes/index'
  root to: 'welcomes#index'

  get 'welcomes/about'
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations',
                 bases: 'api/bases', registration_apis: 'api/registration_apis',
                 sessions: 'api/sessions'}
  # devise_for :users, :controllers => {:registrations => "users/registrations"}
  # namespace :api do
  #   devise_for :users
  # end
end

