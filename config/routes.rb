Rails.application.routes.draw do
  resources :lecturers
  resources :users
  resources :students do
    resources :enrollments
  end 
  resources :courses do
    resources :assignments do
      resources :submissions
    end
  end
  
  root 'home#index'
  get '/about', to: 'home#about'
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  get '/main', to: 'assignments#main'
end
