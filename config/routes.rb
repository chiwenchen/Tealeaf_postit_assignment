PostitTemplate::Application.routes.draw do

  root to: 'posts#index'
  resources :posts, except: [:destroy] do
  	resources :comments, only: [:create]
  end

end
# $rake route
#this can see the created route

#or url: localhost:3000/rails/info/routes
