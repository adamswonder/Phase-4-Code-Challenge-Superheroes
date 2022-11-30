Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resource :heroes, only: [:index, :show]
  resource :powers, only: [:index, :show, :update]
  resource :hero_powers, only: [:index, :create]

  ### Custom routes to show what the resources has within each route
  # get '/heroes', to: 'heroes#index'
  # get '/heroes/:id', to: 'heroes#show'

  # get '/powers/:id', to: 'powers#show'
  # get '/powers', to: 'powers#index'
  # post '/powers/:id', to: 'powers#update'

  # get '/hero_powers', to: 'hero_power#index'
  # post '/hero_powers', to: 'hero_power#create'

end
