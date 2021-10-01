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

  resources :sessions
  resources :categories
  resources :users
  resources :exercises

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
