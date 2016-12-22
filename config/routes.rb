Rails.application.routes.draw do
  get 'posts/index'

  get 'posts/create'

  get 'posts/edit'

  get 'post/index'

  get 'post/create'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get 'users/new'

  get 'users/create'

  get '/new_account' => 'users#new'
  post '/users' => 'users#create'
end
