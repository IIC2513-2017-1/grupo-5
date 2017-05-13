Rails.application.routes.draw do
  root 'welcome#index'
  resources :teams
  resources :bets
  resources :matches
  resources :events
  resources :users
  resources :participations
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
