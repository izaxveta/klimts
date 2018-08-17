Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'
  resources :users, only: [:new, :index, :create]
  get  '/signin',   to: 'sessions#new', as: 'signin'
  post '/signin',   to: 'sessions#create'
end
