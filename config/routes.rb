Rails.application.routes.draw do
  root 'events#index'
  resources :teams
  resources :events do
    resources :matches
  end
  resources :users do
    resources :bets
  end
  resources :participations
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
