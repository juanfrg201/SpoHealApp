Rails.application.routes.draw do
  root 'users#new'

  resources :users, only: [:new, :create]


  get '/service-worker.js', to: redirect('/public/service-worker.js')
end
