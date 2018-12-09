Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'design', to: 'pages#design'
  get 'about', to: 'pages#about'

end
