Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :attractions  
root 'welcome#home'

get '/signup', to: 'users#new'
post '/signup', to: 'users#create' 

get '/signin', to: 'sessions#new'
post '/signin', to: 'sessions#create'

get 'states/most_comments' => 'states#most_comments'

delete 'signout', to: 'sessions#destroy', as: 'signout'

#Authentication

get '/auth/:provider/callback' => 'sessions#create'


resources :users 
resources :states

resources :states do 
  resources :comments, only: [:new, :create, :index]
end 

end
