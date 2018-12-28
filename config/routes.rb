Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'movies#index'

  resources :movies, only: [:index, :show]

  resources :genres, only: [:index]
end
