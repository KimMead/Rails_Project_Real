Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'welcome#home'

get '/auth/:provider/callback' => 'sessions#create'

get '/signup', to: 'users#new'
post '/signup', to: 'users#create' 

get '/signin', to: 'sessions#new'
post '/signin', to: 'sessions#create'

get 'states/most_comments' => 'states#most_comments'

get 'states/alpha' => 'states#alpha'

post 'attractions/:id' => 'attractions#like'

get 'attractions/likes_order' => 'attractions#likes_order'

get 'signout', to: 'sessions#destroy', as: 'signout'

resources :attractions
resources :users 
resources :states

resources :states do 
  resources :comments, only: [:new, :create, :index]
end 

end
