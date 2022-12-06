Rails.application.routes.draw do
  resources :assignments
  resources :courses
  resources :lecturers
  resources :users
  resources :students do
    resources :enrollments
  end 
  
  root 'home#index'
  get '/about', to: 'home#about'
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  

end
