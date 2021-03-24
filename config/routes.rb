Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'events/index', to: 'events#index'
  root "events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users 
  resources :events
  resources :invitations
  get 'users/invitations/new/:event_id', to: 'invitations#new'
end
