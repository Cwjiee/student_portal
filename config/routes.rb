Rails.application.routes.draw do
  resources :students
  root 'home#index'
  get '/about', to: 'home#about'
  get '/signup', to: 'users#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
