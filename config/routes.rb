Rails.application.routes.draw do
  root 'posts#index', as:'home'
  get 'about' => 'pages#about', as: 'about'

  get '/auth', to: 'auth#new'
  post '/auth', to: 'auth#create'
  delete '/auth', to: 'auth#destroy'

  get '/users', to: 'users#new'
  post '/users', to: 'users#create'

  resources :posts do
    resources :comments
  end

end
