Rails.application.routes.draw do
  root 'users#login'

  resources :users, only: [:new, :create] do
    # Rutas adicionales para inicio de sesión
    collection do
      get 'login', to: 'users#login'
      post 'authenticate', to: 'users#authenticate'
    end
  end


  get '/service-worker.js', to: redirect('/public/service-worker.js')
end
