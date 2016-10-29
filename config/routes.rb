Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "webrts#index"

  get '/profile/:username', to: 'webrts#profile', as: 'profile'
  get '/profile', to: 'webrts#profile'
  post '/getmapdata', to: 'maps#getMapData'
  get '/town/:id', to: 'towns#town', as: 'town'
end
