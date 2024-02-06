require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root 'sessions#new'
  
  resources :home_pages, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :community do 
    resources :community_posts, only: [:new, :create]
  end
  resources :user_activities, only: [:new, :create, :index, :show]
  resources :activity_recomendations, only: [:index]
  
  namespace :user do
    resources :user_parametrizations, only: [:new, :create]
  end

  resources :notifications, only: [:create]


  get '/service-worker.js', to: redirect('/public/service-worker.js')
end
