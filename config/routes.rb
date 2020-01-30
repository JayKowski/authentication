Rails.application.routes.draw do
  resources :user
  #resources :sessions
  resources :users, except: [:new]

  root 'welcome#home'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
