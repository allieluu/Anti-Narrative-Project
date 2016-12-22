Rails.application.routes.draw do
  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get 'users/new'

  get 'users/create'

  get '/new_account' => 'users#new'
  post '/users' => 'users#create'
end
