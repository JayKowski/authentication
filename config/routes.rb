Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :index, :show] 
  #resources :sessions
  resources :users, except: [:new]

  root 'posts#index'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
