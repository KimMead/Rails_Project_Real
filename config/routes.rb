Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#home'

get '/signup', to: 'users#new'
post '/signup', to: 'users#create' 

get '/signin', to: 'sessions#new'
post '/signin', to: 'sessions#create'

get '/logout', to: 'sessions#destroy'

post '/states', to: 'states#show'

resources :users do
  resources :trips 
end 


resources :attractions, only: [:index, :show, :new, :create]
resources :states, only: [:index, :show]

end
