Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get 'design', to: 'pages#design'
  get 'about', to: 'pages#about'
  get 'cookies', to: 'pages#cookies'

  get 'clothing', to: 'products#clothing'
  get 'clothing/:id', to: 'products#show', as: 'clothing/item'

  get 'shoes', to: 'products#shoes'
  get 'shoes/:id', to: 'products#show', as: 'shoes/item'

  get 'home', to: 'products#home'
  get 'home/:id', to: 'products#show', as: 'home/item'

  resources :products


end
