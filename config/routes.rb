Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'welcome#home'

get '/signup', to: 'users#new'
post '/signup', to: 'users#create' 

get '/signin', to: 'sessions#new'
post '/signin', to: 'sessions#create'

get '/logout', to: 'sessions#destroy'

get '/auth/facebook/callback' => 'sessions#create'


resources :users 

resources :attractions  
resources :states
    
end
