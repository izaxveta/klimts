Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'
  # ADMIN
  get '/admin/dashboard', to:'admin/dashboard#index', as: 'admin_dashboard'

  # DEFAULT
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  # GLOBAL
  resources :users, only: [:index, :create]
  get  '/register', to: 'users#new',    as: 'register'
  get  '/signin',   to: 'sessions#new', as: 'signin'
  post '/signin',   to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'signout'
end
