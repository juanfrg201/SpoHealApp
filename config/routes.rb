# frozen_string_literal: true

require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root 'sessions#new'

  # RegularUserrViews
  resources :home_pages, only: [:index]
  resources :sessions, only: %i[new create destroy]
  resources :users, only: %i[new create]
  resources :users, only: %i[new create edit update show] do
    resources :user_stadistics, only: [:index]
  end
  resources :community do
    resources :community_posts, only: %i[new create]
  end
  resources :user_activities, only: %i[new create index show]
  resources :activity_recomendations, only: [:index]

  namespace :user do
    resources :user_parametrizations, only: %i[new create]
  end

  resources :notifications, only: [:create]
  resources :user_routes, only: %i[index new create show] do
    patch 'inactive', on: :member
  end
  resources :routes, only: %i[index show new create]

  # AdminViews
  resources :activity_types, only: %i[index create new destroy]
  resources :activities, only: %i[index create show] do
    post 'upload_image', on: :member
  end
  resources :nutricion_tips, only: %i[index show create] do
    post 'upload_image', on: :member
  end
  resources :admin_users, only: %i[new create]

  get '/service-worker.js', to: redirect('/public/service-worker.js')
end
