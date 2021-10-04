Rails.application.routes.draw do
  # write your customed routes on top of the resources ones! 

  # home page route 
  root  'sessions#home'

  # signup routes 
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  # login routes; one to display the login page - second one to process the login information 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  # logout route 
  delete '/logout' => 'sessions#destroy'

  # omnioauth callback route 
  get '/auth/google_oauth2/callback' => 'sessions#google' # for one type of omniauth 
  # get '/auth/:provider/callback' # could be written like that if you want to develop 3 different types of omniauth and you want all of them to go to the same place in your controller. 

  # resources :sessions
  resources :categories
  resources :users do 
    resources :exercises, only: [:new, :create, :index]
  end 
  resources :exercises do 
    resources :categories 
    # these routes within [] are called shallow routing (its crucial to have the _id)
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# nested routes 
# new, show or index 

# '/users'

# '/users/:id/exercises'
# '/users/:id/categories'

# '/exercises'

# '/exercises/:id/categories'

# '/categories'
# '/categories/:id/exercises'