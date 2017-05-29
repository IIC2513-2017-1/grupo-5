Rails.application.routes.draw do
  root 'events#index'
  resources :teams
  resources :events do
    resources :invitations, only: [:create]
  end
  resources :invitations, only: [:destroy]
  resources :matches
  resources :bets, only: [:new, :create, :edit, :show]
  resources :users do
    resources :follows, only: [:create]
  end
  resources :follows, only: [:destroy]
  resources :participations
  resource :session, only: [:new, :create, :destroy]
  resource :placing, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
