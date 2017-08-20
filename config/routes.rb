Rails.application.routes.draw do
  root 'posts#index'

  resources :users, except: [:new, :create]
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :posts, only: [:index, :show, :new, :create]

  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  delete '/logout', to: 'logins#destroy'
end
