Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'design', to: 'pages#design'
  get 'about', to: 'pages#about'

  get 'clothing', to: 'products#clothing'
  get 'clothing/:id', to: 'products#show'
  get 'shoes', to: 'products#shoes'
  get 'shoes/:id', to: 'products#show'
  get 'home', to: 'products#home'
  get 'home/:id', to: 'products#show'

  get 'products/new', to: 'products#new'
  post 'products', to: 'products#create'




end
