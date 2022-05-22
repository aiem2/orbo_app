Rails.application.routes.draw do
  resources :benefits
  resources :contents
  resources :ratings
  resources :prospects
  resources :partners
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :users, controllers: {sessions: 'users/sessions'}
  devise_for :users, controllers: {registrations: 'users/registrations'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#home'
end
