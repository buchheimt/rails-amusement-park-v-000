Rails.application.routes.draw do

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post 'users/:id/ride', to: 'users#ride', as: 'user_ride'

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]

  root to: 'welcome#home'

end
