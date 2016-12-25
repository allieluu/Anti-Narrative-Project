Rails.application.routes.draw do

  # root 'posts/index' => 'posts#index'

  # get 'posts/index' => 'posts#index'
  #
  # get 'posts/create' => 'posts#create'
  #
  # get 'posts/edit' => 'posts#edit'

  resources :posts

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get 'users/new' => 'users#new'

  get 'users/create' => 'users#create'

  get '/new_account' => 'users#new'
  post '/users' => 'users#create'
end
