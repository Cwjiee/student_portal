Rails.application.routes.draw do
  resources :lecturers

  resources :users
  resources :students
  
  root 'home#index'
  get '/about', to: 'home#about'
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  

end
