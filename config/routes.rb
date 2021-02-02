Rails.application.routes.draw do
  root 'events#index'

  resources :users
  resources :events, only: [:index, :show, :new, :create]
  resources :attendences, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
