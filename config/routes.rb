PostitTemplate::Application.routes.draw do

	root to: 'posts#index'




	get '/register', to: 'users#new' # change user#new to register
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  #get '/profile', to: 'users#show'
  #get '/profile', controller: :users, to: :show

  
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

  namespace :admin do 
    resources :articles, :tests
  end








end
# $rake route
#this can see the created route

#or url: localhost:3000/rails/info/routes
