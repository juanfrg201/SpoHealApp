Rails.application.routes.draw do
  root 'sessions#new'
  
  resources :home_pages, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :users, only: [:new, :create]
  resources :community_posts, only: [:new, :create]
  resources :community, only: [:new, :create, :destroy, :show, :index]
  
  namespace :user do
    resources :user_parametrizations, only: [:new, :create]
  end


  get '/service-worker.js', to: redirect('/public/service-worker.js')
end
