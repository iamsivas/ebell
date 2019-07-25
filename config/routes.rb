Rails.application.routes.draw do
  root 'welcomes#index'
  resources :users

  get 'admin', to: 'admin#index'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
