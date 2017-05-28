Rails.application.routes.draw do
  root 'events#index'
  resources :teams
  resources :events
  resources :matches
  resources :bets
  resources :users do
    resources :follows, only: [:create]
  end
  resources :follows, only: [:destroy]
  resources :participations
  resource :session, only: [:new, :create, :destroy]
  resource :placing, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
