Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "webrts#index"

  get '/profile/:username', to: 'webrts#profile', as: 'patient'
  get '/profile', to: 'webrts#profile'
end
