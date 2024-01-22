Rails.application.routes.draw do
  root 'sessions#new'
  
  resources :home_pages, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  
  namespace :user do
    resources :user_parametrizations, only: [:new, :create]
  end


  get '/service-worker.js', to: redirect('/public/service-worker.js')
end
