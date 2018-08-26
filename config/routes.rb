Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'

  # ADMIN
  get  '/admin/dashboard',    to: 'admin/dashboard#index', as: 'admin_dashboard'
  get  '/admin/products',     to: 'admin/products#index',  as: 'admin_products'
  get  '/admin/products/new', to: 'admin/products#new',    as: 'new_admin_product'
  post '/admin/products',     to: 'admin/products#create'

  # DEFAULT
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  # GLOBAL
  get    '/register', to: 'users#new',        as: 'register'
  post   '/users',    to: 'users#create'
  get    '/signin',   to: 'sessions#new',     as: 'signin'
  post   '/signin',   to: 'sessions#create'
  delete '/signout',  to: 'sessions#destroy', as: 'signout'
end
