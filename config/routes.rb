require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :products

  resources :appointments
  resources :patients do
    resources :doctors, only: [:index]
    resources :appointments, only: [:index, :new]
  end
  resources :doctors do
    resources :appointments, only: [:index, :new]
  end
  get 'homes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
  mount Sidekiq::Web => "/sidekiq"
end
