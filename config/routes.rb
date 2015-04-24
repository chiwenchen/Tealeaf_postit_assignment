PostitTemplate::Application.routes.draw do

	root to: 'posts#index'

	get '/register', to: 'users#new' # change user#new to register
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  
  resources :posts, except: [:destroy] do
    member do
      post :vote
    end
  	resources :comments, only: [:create]
  end

  resources :comments do 
    member do
      post :vote
    end
  end

  resources :categories, only: [:create, :new, :show]
  resources :tests
  resources :users








end
# $rake route
#this can see the created route

#or url: localhost:3000/rails/info/routes
