Rails.application.routes.draw do
  root 'root#home'
  get '/welcome' =>'root#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get 'user_settings/show'

  
end
