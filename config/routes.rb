Rails.application.routes.draw do
  root 'posts#index', as:'home'
  get 'about' => 'pages#about', as: 'about'

  get '/auth', to: 'auth#index'
  post '/auth', to: 'auth#create'
  delete '/auth', to: 'auth#destroy'

  post '/users', to: 'users#create'

  resources :posts do
    resources :comments
  end

end
