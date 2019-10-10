Rails.application.routes.draw do
  
  root 'root#home'
  get '/welcome' =>'root#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get 'users/:id/edit' =>'users#edit'
  post 'users/update'

  resources :contacts, only: [:new, :create, :destroy]

  namespace :user do
    resources :standart_applications, only: [:new, :create, :edit, :update]
  end

  resources :job_postings, only: [:index]

  resources :applied_jobs


end
