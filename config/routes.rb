Scribbler::Application.routes.draw do
  get '/auth/twitter/callback', :to => 'sessions#create', :as => 'callback'
  get '/auth/failure', :to => 'sessions#error', :as => 'failure'
  get '/profile', :to => 'sessions#show', :as => 'show'
  delete '/signout', :to => 'sessions#destroy', :as => 'signout'

  resources :scribbles

  root :to => 'scribbles#index'
end
