Rails.application.routes.draw do
  root 'users#login'

  resources :users, only: [:new, :create] do
    collection do
      get 'login', to: 'users#login'
      post 'authenticate', to: 'users#authenticate'
    end
  end

  namespace :user do
    resources :user_parametrizations, only: [:new, :create]
  end


  get '/service-worker.js', to: redirect('/public/service-worker.js')
end
