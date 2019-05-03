Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/signup' => 'players#new'
  get '/auth/github/callback' => 'sessions#github_login'

  resources :players do
    resources :leagues, :shallow => true
    resources :invitations, :shallow => true
  end

end
