Rails.application.routes.draw do

  resources :locations
  post 'login', to: 'auth#create'

  # Signup routes: 
  # get 'signup', to: 'users#new'
  # post 'signup', to: 'users#create'

  # login/out routes: 
  # get 'login', to: 'sessions#new' # logged_in 
  # post 'login', to: 'sessions#create'

  get 'logout', to: 'sessions#destroy' # delete route

  resources :sessions
  resources :users
   
  # get '/auth', to: 'users#show'

  # login/out routes: 
  
  # to log in - we use post as we need to get some data from the user 
  # post 'login', to: 'sessions#create' 

  # log out 
  # delete 'logout', to: 'sessions#destroy' 
  
end

  # routes from JWT module 
  
  # namespace :api do
  #   resources :users, only: [:create]
  #     post '/login', to: 'auth#create'
  #     get '/profile', to: 'users#profile'
  # end

  # routes from https://www.youtube.com/watch?v=zSt5G3s3OJI&list=PLgYiyoyNPrv_yNp5Pzsx0A3gQ8-tfg66j&index=7

  # resources :registrations
  # resources :statics
  # Accustomed routes have to be defined at the top of the file 
  # root to: 'statics#home' 

  # Signup routes: 
  # get 'signup', to: 'users#new'
  # post 'signup', to: 'users#create'

  # login/out routes: 
  # get 'login', to: 'sessions#new' # logged_in 
  # post 'login', to: 'sessions#create'

  # get 'logout', to: 'sessions#destroy' # delete route 

  # We could code the route as below: 
  # get '/auth/google_oauth2/callback', to: 'sessions#omniauth' specific for google 

  # OR we could make the route a Dynamic provider for all FB, Google, etc - this route is coming back from Google and going out as the last one is handled by middleware. 
  
  # get '/auth/:provider/callback', to: 'sessions#omniauth' 