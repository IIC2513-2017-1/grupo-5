Rails.application.routes.draw do
  root 'events#index'
  resources :teams
  resources :events
  resources :matches
  resources :bets
  resources :users
  resources :participations
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
