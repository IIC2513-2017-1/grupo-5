Rails.application.routes.draw do
  root 'events#index'
  resources :teams, only: [:create, :destroy, :new, :edit]
  resources :events do
    resources :invitations, only: [:create]
  end
  resources :invitations, only: [:destroy]
  resources :matches, only: [:destroy, :new, :create, :edit, :show]
  resources :bets, only: [:new, :create, :destroy]
  resources :users do
    resources :follows, only: [:create]
  end
  resources :follows, only: [:destroy]
  resources :participations
  resource :session, only: [:new, :create, :destroy]
  resource :placing, only: [:create]
  resource :informations, only: [:create]
  resource :eventresults, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
