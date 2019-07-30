Rails.application.routes.draw do
  
  resources :applied_jobs
  root 'root#home'
  get '/welcome' =>'root#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post 'users/update'

  resources :contacts, only: [:create, :destroy]

  namespace :user do
    resources :standart_applications, only: [:create, :update]
  end


end
