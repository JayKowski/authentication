Rails.application.routes.draw do
  resources :user
  resources :sessions
  resources :users, except: [:new]

  root 'sessions#new'

  get '/sessions/new', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
